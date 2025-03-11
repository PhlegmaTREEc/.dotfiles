self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/232635194/multiviewer-for-f1_1.38.1_amd64.deb";
      sha256 = "sha256-3UgpjQdZYr48MPoqgHci6Yvo+jxK7oa3THl/JuL8tRo=";
    };
  });
}
