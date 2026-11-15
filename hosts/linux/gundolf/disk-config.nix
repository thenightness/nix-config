{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    ../../disks/btrfs-luks.nix
    {
      _module.args = {
        disk = "/dev/disk/by-id/nvme-eui.a428b77eeb7a0049";
        withSwap = true;
        swapSize = "32";
      };
    }
  ];
}
