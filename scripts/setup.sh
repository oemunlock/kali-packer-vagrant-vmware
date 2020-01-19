echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
sudo DEBIAN_FRONTEND=noninteractive apt-get -o Dpkg::Options::="--force-confnew" dist-upgrade -yq
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -qq update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -qq upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -qq install python-pip ansible open-vm-tools open-vm-tools-desktop fuse linux-headers-$(uname -r)
sudo DEBIAN_FRONTEND=noninteractive apt-get -y autoclean
sudo DEBIAN_FRONTEND=noninteractive apt-get -y clean
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync
shutdown -r now