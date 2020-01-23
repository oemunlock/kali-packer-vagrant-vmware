# kali-packer-vagrant-vmware

## Setup and Config

uses `kali-2019.4/kali-linux-2019.4-gnome-amd64` image of kali linux.

`packer` uses `kali.json`, `scripts/setup.sh` and `preseed.cfg` to configure the installation process.

`vagrant` uses `ansible` and `playbook.yml` to configure the VM after the packer build.

## Use

run `./packer.sh` to build a `Kali.box` file to use with `vagrant` and `vmware fusion`. 

run `./vagrant.sh` to run `Kali.box`. 
