# nixul

![Nixul logo](nix/assets/public/logo.png)

<div align="center">

![License](https://img.shields.io/github/license/Sultonov-557/nixul?style=for-the-badge&color=b4befe)
![NixOS](https://img.shields.io/badge/NixOS-unstable-blue?style=for-the-badge&logo=nixos&logoColor=white&color=74c7ec)
![Build Status](https://img.shields.io/github/actions/workflow/status/Sultonov-557/nixul/build.yml?style=for-the-badge&color=a6e3a1)

</div>

Modular NixOS + Home Manager configs that keep hosts thin and the shared module tree rich. Built to be fast, reversible, and calm enough for 3 AM fixes. 🌙✨

## Welcome to Nixul 🚀

Declarative NixOS setups using **flake-parts**, with shared modules that configure both the system and user layers together (check out `nix/modules/desktop/wms/hyprland`!).

Hosts carry only hardware specifics, hostname, and tiny overrides. Keeping it clean! 🧹

## 📊 Stats & Tech

<p align="center">
  <img src="https://github-readme-stats.vercel.app/api?username=Sultonov-557&show_icons=true&theme=catppuccin_mocha&bg_color=1e1e2e&title_color=cba6f7&text_color=cdd6f4&icon_color=f5c2e7&border_color=313244&hide_border=true" alt="Sultonov-557's Github Stats" />
  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=Sultonov-557&layout=compact&theme=catppuccin_mocha&bg_color=1e1e2e&title_color=cba6f7&text_color=cdd6f4&icon_color=f5c2e7&border_color=313244&hide_border=true" alt="Top Languages" />
</p>

<div align="center">

![Nix](https://img.shields.io/badge/Nix-5277C3?style=for-the-badge&logo=nix&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-00A4C7?style=for-the-badge&logo=hyprland&logoColor=white)
![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home_Manager-5277C3?style=for-the-badge&logo=nix&logoColor=white)
![Stylix](https://img.shields.io/badge/Stylix-FCC624?style=for-the-badge&logo=nixos&logoColor=black)

</div>

## Get Started in Seconds ⚡

1.  **Install NixOS** with flakes enabled & grab `nh` (`nix profile install nixpkgs#nh`).
2.  **Clone** this repo to your machine. 👯
3.  **Copy** a host folder under `nix/hosts/`, set `nixul.user`, hostname, and drop in your generated `hardware-configuration.nix`.
4.  *(Optional)* Adjust `home.nix` for your displays and favorite apps. 🎨
5.  **Build & Switch**: `nh os switch .#<host>` and liftoff! 🚀

## Command Center 🛠️

| Action | Command |
| :--- | :--- |
| **Rebuild & Switch** | `nh os switch .#<host>` |
| **Test (No Switch)** | `nh os test .#<host>` |
| **Boot (Next Only)** | `nh os boot .#<host>` |
| **Build Only** | `nh os build .#<host>` |
| **Format Code** | `nix fmt` |
| **Lint Code** | `nix run nixpkgs#deadnix -- --fail .` |
| **Health Check** | `nix flake check --all-systems --show-trace` |

## Documentation 📚

-   **Start Here**: [Install & Troubleshooting](docs/workflows.md) | [Recovery](docs/recovery.md)
-   **Deep Dive**: [Architecture](docs/architecture.md) | [Modules](docs/modules.md)
-   **Manage Hosts**: [Hosts Guide](docs/hosts.md)
-   **Secrets & Custom**: [Secrets](docs/secrets.md) | [Customization](docs/customization.md)
-   **Questions?**: [FAQ](docs/faq.md)

## The Vibe 🧠

-   **Shared First**: Modules do the heavy lifting, hosts just ride along.
-   **Panic-Friendly**: Simple > Clever. We want to sleep at night. 😴
-   **Unified**: One module to rule them all (System + Home).

## License / Credits 💖

Personal NixOS config—**steal these ideas!**
Powered by **NixOS**, **flake-parts**, **Home Manager**, **Stylix**, **sops-nix**, **Hyprland**, and friends.
