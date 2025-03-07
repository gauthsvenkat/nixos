{ username, ... }:
{
  # NOTE: Enable ssh in the individual hosts
  services.openssh = {
    hostKeys = [
      {
        type = "ed25519";
        path = "/home/${username}/.ssh/id_ed25519";
      }
    ];

    knownHosts = {
      thunderdome.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBjZq6GCEU+TpzLRthwvjzN6pPO+gJt2ngakYpxycf+y";
      thinkpad.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM7C+VPx3ZLurAON5pknD1AlkvdsmB+0J63Yo8y7MVMJ";
      # TODO: remove then when replacing mac
      mac.publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDL5xWBHUGTxELm2QMa4EftqRPXBroDkZZxmCqWeyXm3";
    };
  };
}
