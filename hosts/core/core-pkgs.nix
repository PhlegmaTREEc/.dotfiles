{ pkgs, inputs, ... }: 

{
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    nixfmt-rfc-style
    nixd
    marksman
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
