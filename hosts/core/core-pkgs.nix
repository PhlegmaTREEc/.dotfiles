{ pkgs, inputs, ... }: 

{
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    nixfmt-rfc-style
    nixd
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}
