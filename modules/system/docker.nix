{ ... }:
{
  virtualisation.docker.enable = true;
  # Permite-te usar o docker sem escrever "sudo" sempre
  users.users.gonki.extraGroups = [ "docker" ]; 
}
