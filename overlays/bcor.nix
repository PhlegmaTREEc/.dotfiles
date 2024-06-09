final: prev:
{
  bcor = prev.bazecor.overrideAttrs (old: rec {
    src = prev.fetchurl {
      url = "https://github.com/Dygmalab/Bazecor/releases/download/v1.4.0-rc4/Bazecor-1.4.0-rc.4-x64.AppImage";
      sha256 = "sha256-ArbWUiL/eLjJYMS1yHBgDplHAUQcZ0EYWftnZuSwGH4=";
    };
  });
}
