self: super:

{
  bazecor = super.applyPatches {
    src = super.bazecor;
    postPath = ''
      rm lib/udev/rules.d/*-10-dygma.rules
      ln -s --target-directory=lib/udev/rules.d ${./60-dygma.rules}
    '';
  };
}
