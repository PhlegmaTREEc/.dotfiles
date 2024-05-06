self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    #version = "1.31.7";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/165303528/multiviewer-for-f1_1.31.9_amd64.deb";
      sha256 = "sha256-yn4yGP2m5AH2WiSQuPlUQpSAWoOKRWCLZxcBF22c8Xo=";
    };
  });
}
