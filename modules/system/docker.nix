{ config, pkgs, ... }:
{
  virtualisation.docker.enable = true;
  # Permite-te usar o docker sem escrever "sudo" sempre
  users.extraGroups.docker.members = [ "gonki" ]; 
}
