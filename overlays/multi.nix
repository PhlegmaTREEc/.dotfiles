self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/180492850/multiviewer-for-f1_1.35.2_amd64.deb";
      sha256 = "sha256-V1+kMgfbgDS47YNIotmzrh2Hry5pvdQvrzWwuKJY1oM=";
    };
  });
}
