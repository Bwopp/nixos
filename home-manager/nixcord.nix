{ config, pkgs, inputs, ... }:
{
  programs.nixcord = {
    enable = true;
    legcord.enable = true;
  };
}