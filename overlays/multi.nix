self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/168727396/multiviewer-for-f1_1.32.1_amd64.deb";
      sha256 = "sha256-cnfye5c3+ZYZLjlZ6F4OD90tXhxDbgbNBn98mgmZ+Hs=";
    };
  });
}
