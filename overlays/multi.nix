self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      url = "https://releases.multiviewer.app/download/243289393/multiviewer-for-f1_1.43.2_amd64.deb";
      sha256 = "sha256-wdA5f/80GkKP6LrrP2E6M9GY5bl6rg7Spz7NWB7cQjg=";
    };
  });
}
