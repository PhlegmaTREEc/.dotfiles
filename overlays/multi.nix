self: super: {
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/289869947/multiviewer_2.1.0_amd64.deb";
      sha256 = "sha256-H+tt2FiT1UxkWBxpuyOIUjRMOMl7kN/SFH/WqoRdVUU=";
    };
  });
}
