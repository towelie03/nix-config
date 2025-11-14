{ pkgs, ... }:
{
  services.gvfs.enable = true;            
  services.udisks2.enable = true;         

  programs.file-roller = {
    enable = true;
    package = pkgs.file-roller;
  };

  environment.systemPackages = with pkgs; [
    nautilus
    nautilus-open-any-terminal   
    sushi                        
    ffmpegthumbnailer
  ];
}
