{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    aldente
    mkalias
    python3
    raycast
    zstd
    jankyborders
    sketchybar-app-font
  ];
}
