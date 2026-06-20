{ config, pkgs, inputs, lib, ... }:
{
  # Shell
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      tup = "tailscale up";
      tdown = "tailscale down";
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix flake update --flake /etc/nixos/";
      gc = "sudo nix-collect-garbage";
      nixgitpush = "sudo git -C /etc/nixos add . && sudo git -C /etc/nixos commit -m (date '+%Y-%m-%d %H:%M:%S') && sudo git -C /etc/nixos push";
      wup = "warp-cli connect";
      wdown = "warp-cli disconnect";
      vup = "systemctl start sing-box";
      vdown = "systemctl stop sing-box";
    };
  };

  users.defaultUserShell = pkgs.fish;
}