let
  keys = import ./public_keys.nix;
in
{
  "hosts/nixpi/.env".publicKeys = keys.ando ++ keys.nixpi;
  "hosts/elitedesk/.env".publicKeys = keys.ando ++ keys.elitedesk;
}
