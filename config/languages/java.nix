{pkgs, ...}: {
  plugins = {
    jdtls = {
      enable = true;
      jdtLanguageServerPackage = null;
      settings.cmd = ["jdtls"];
    };
    neotest = {
      enable = true;
      adapters = {
        java.enable = true;
      };
    };
  };
}
