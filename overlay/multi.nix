final: prev:
{
  multi = prev.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    version = "1.31.4";
    src = prev.fetchurl {
      url = "https://releases.multiviewer.app/download/154454223/multiviewer-for-f1_${version}_amd64.deb";
      sha256 = "";
    };
  });
}
