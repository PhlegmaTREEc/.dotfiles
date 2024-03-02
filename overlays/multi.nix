self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    version = "1.31.4";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/154454223/multiviewer-for-f1_${version}_amd64.deb";
      sha256 = "sha256-HlKs4GMyHLLfQUGSsX6O8ImJ9GCoSc9KAHEuDESohvw=";
    };
  });
}
