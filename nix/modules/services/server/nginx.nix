{
  lib,
  pkgs,
  config,
  ...
}:
{
  system =
    { cfg, ... }:
    let
      tlsCertificatePath = "/var/lib/internal-ca/certs/home-wildcard.crt";
      tlsCertificateKeyPath = "/var/lib/internal-ca/private/home-wildcard.key";
      tlsRootCaPath = "/var/lib/internal-ca/root-ca.crt";
    in
    {
      environment.systemPackages = lib.mkIf cfg.enable (with pkgs; [ nginx ]);
      systemd.tmpfiles.rules = lib.mkIf cfg.enable [
        "d /var/lib/internal-ca 0755 root root -"
        "z /var/lib/internal-ca 0755 root root -"
        "d /var/lib/internal-ca/certs 0755 root root -"
        "d /var/lib/internal-ca/private 0750 root nginx -"
        "z /var/lib/internal-ca/certs/home-wildcard.crt 0640 root nginx -"
        "z /var/lib/internal-ca/private/home-wildcard.key 0640 root nginx -"
      ];

      systemd.services.internal-ca-bootstrap = lib.mkIf cfg.enable {
        description = "Generate internal CA and wildcard certificate";
        wantedBy = [ "multi-user.target" ];
        before = [ "nginx.service" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
        };
        script = ''
          set -eu
          umask 027

          cert_path="${tlsCertificatePath}"
          key_path="${tlsCertificateKeyPath}"
          root_crt_path="${tlsRootCaPath}"
          root_key_path="/var/lib/internal-ca/private/root-ca.key"

          if [ -s "$cert_path" ] && [ -s "$key_path" ] && [ -s "$root_crt_path" ] && [ -s "$root_key_path" ]; then
            ${pkgs.coreutils}/bin/chmod 0640 "$cert_path" "$key_path"
            ${pkgs.coreutils}/bin/chown root:nginx "$cert_path" "$key_path"
            exit 0
          fi

          tmpdir="$(${pkgs.coreutils}/bin/mktemp -d)"
          trap '${pkgs.coreutils}/bin/rm -rf "$tmpdir"' EXIT

          cat > "$tmpdir/req.cnf" <<'EOF'
[req]
distinguished_name = req_distinguished_name
req_extensions = v3_req
prompt = no

[req_distinguished_name]
CN = *.home

[v3_req]
subjectAltName = @alt_names

[alt_names]
DNS.1 = *.home
DNS.2 = home
EOF

          ${pkgs.openssl}/bin/openssl genrsa -out "$tmpdir/root-ca.key" 4096
          ${pkgs.openssl}/bin/openssl req -x509 -new -key "$tmpdir/root-ca.key" -sha256 -days 3650 \
            -out "$tmpdir/root-ca.crt" -subj "/CN=home.internal Root CA"

          ${pkgs.openssl}/bin/openssl genrsa -out "$tmpdir/home-wildcard.key" 2048
          ${pkgs.openssl}/bin/openssl req -new -key "$tmpdir/home-wildcard.key" \
            -out "$tmpdir/home-wildcard.csr" -config "$tmpdir/req.cnf"
          ${pkgs.openssl}/bin/openssl x509 -req -in "$tmpdir/home-wildcard.csr" \
            -CA "$tmpdir/root-ca.crt" -CAkey "$tmpdir/root-ca.key" -CAcreateserial \
            -out "$tmpdir/home-wildcard.crt" -days 825 -sha256 \
            -extensions v3_req -extfile "$tmpdir/req.cnf"

          ${pkgs.coreutils}/bin/install -m 0644 "$tmpdir/root-ca.crt" "$root_crt_path"
          ${pkgs.coreutils}/bin/install -m 0600 "$tmpdir/root-ca.key" "$root_key_path"
          ${pkgs.coreutils}/bin/install -m 0640 "$tmpdir/home-wildcard.crt" "$cert_path"
          ${pkgs.coreutils}/bin/install -m 0640 "$tmpdir/home-wildcard.key" "$key_path"

          ${pkgs.coreutils}/bin/chown root:root "$root_crt_path" "$root_key_path"
          ${pkgs.coreutils}/bin/chown root:nginx "$cert_path" "$key_path"
        '';
      };

      systemd.services.nginx = lib.mkIf cfg.enable {
        wants = [ "internal-ca-bootstrap.service" ];
        after = [ "internal-ca-bootstrap.service" ];
      };

      services.nginx = lib.mkIf cfg.enable {
        enable = true;
        recommendedBrotliSettings = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;

        virtualHosts = {
          public = {
            serverName = "public.home";
            root = ../../../assets/public;
            default = true;
            addSSL = true;
            sslCertificate = tlsCertificatePath;
            sslCertificateKey = tlsCertificateKeyPath;
            locations."/" = {
              tryFiles = "$uri =404";
            };
          };
        };
      };

      assertions = [
        {
          assertion = (!cfg.enable) || config.nixul.host.modules.core.security.network.unbound.enable;
          message = "services.server.nginx requires core.security.network.unbound.enable = true";
        }
      ];
    };
  home =
    { cfg, ... }:
    {
      home.packages = lib.mkIf cfg.enable (with pkgs; [ nginx ]);
    };

  options = lib.mkOption {
    type = lib.types.submodule {
      options = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable nginx";
        };
      };
    };
    default = {
      enable = false;
    };
  };
}
