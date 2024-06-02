self: super:
{
  myMulti = super.multiviewer-for-f1.overrideAttrs (old: rec {
    pname = "multiviewer-for-f1";
    src = super.fetchurl {
      #url = "https://releases.multiviewer.app/download/165303528/multiviewer-for-f1_1.31.9_amd64.deb";
      url = "https://releases.multiviewer.app/download/168681657/multiviewer-for-f1_1.32.0_amd64.deb";
      sha256 = "sha256-Ci1pbzjJVWXigrDBuGXLD3HrYXmJbd648lVJXoGK7t0=";
    };
  });
}
