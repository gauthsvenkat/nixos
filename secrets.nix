let
  keys = import ./common/public_keys.nix;
in
{
  "hosts/nixpi/.env".publicKeys = keys;
}
