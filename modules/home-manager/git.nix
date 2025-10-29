{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = "krabbibi";
    userEmail = "sebastian.alexander.mock@gmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
