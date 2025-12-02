{ pkgs, ... }: {
  home.packages = with pkgs; [ antigravity gemini-cli cursor-cli ];
}
