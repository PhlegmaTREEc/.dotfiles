self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/192684463/multiviewer-for-f1_1.36.1_amd64.deb";
      sha256 = "sha256-qbkig46BIr8Cs6GPZDBRalimjb+QK7PfkBJvQXIrYgw=";
    };
  });
}
