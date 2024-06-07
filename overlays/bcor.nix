self: super:
{
  bcor = super.bazecor.overrideAttrs (old: rec {
    pname = "bazecor";
    src = super.fetchurl {
      url = "https://github.com/Dygmalab/Bazecor/releases/download/v1.4.0-rc4/Bazecor-1.4.0-rc.4-x64.AppImage";
      sha256 = "";
    };
  });
}
