self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    #version = "1.31.7";
    src = super.fetchurl {
      url = "https://releases.multiviewer.dev/download/155752210/multiviewer-for-f1_1.37.7_amd64.deb";
      sha256 = "sha256-Tnr5Lvzoswhbvhs9SOprP2TcPbr6SP1uR3OqtnqiPrA=";
    };
  });
}
