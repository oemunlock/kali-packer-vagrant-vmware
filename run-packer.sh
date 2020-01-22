rm -rf output-vmware-iso package_cache .vagrant Kali.box
packer validate kali.json
packer build -debug kali.json