{ pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      tup = "tailscale up";
      tdown = "tailscale down";
      rebuild = "sudo nixos-rebuild switch";
      update = "sudo nix flake update --flake /etc/nixos/";
      gc = "sudo nix-collect-garbage";
      nixgitpush = "git -C /etc/nixos add . && git -C /etc/nixos commit -m (date '+%Y-%m-%d %H:%M:%S') && git -C /etc/nixos push";
      wup = "warp-cli connect";
      wdown = "warp-cli disconnect";
    };
  };

  users.defaultUserShell = pkgs.fish;
}