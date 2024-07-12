self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/173944038/multiviewer-for-f1_1.33.1_amd64.deb";
      sha256 = "sha256-edJaklGSdLc505GdBHqUiMb2cjQnfokFxi5IyatjPwc=";
    };
  });
}
