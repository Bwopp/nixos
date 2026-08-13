{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
    '';
    shellAliases = {
      ll = "ls -l";
      tup = "tailscale up";
      tdown = "tailscale down";
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix flake update --flake /etc/nixos/";
      gc = "sudo nix-collect-garbage";
      optimise = "sudo nix-store --optimise";
      deleteold = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5";
      fullclean = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +5 && sudo nix-collect-garbage && sudo nix-store --optimise";
      nixgitpush = "git -C /etc/nixos add . && git -C /etc/nixos commit -m (date '+%Y-%m-%d %H:%M:%S') && git -C /etc/nixos push";
      nixgitpull = "git -C /etc/nixos pull";
      wup = "warp-cli connect";
      wdown = "warp-cli disconnect";
      vup = "sudo systemctl start sing-box";
      vdown = "sudo systemctl stop sing-box";
    };
  };

  users.defaultUserShell = pkgs.fish;
}