self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/237882044/multiviewer-for-f1_1.42.1_amd64.deb";
      sha256 = "sha256-ij3i073j9JKGGVMZ8mLSIEimhUw0RNFfTqqlLAK31OE=";
    };
  });
}
