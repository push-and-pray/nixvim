{pkgs, ...}: {
  plugins = {
    jdtls = {
      enable = true;
      jdtLanguageServerPackage = null;
      settings.cmd = ["jdtls"];
    };
  };
}
