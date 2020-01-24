cat >/etc/apt/listchanges.conf <<EOL
[apt]
frontend=text
email_address=root
confirm=0
save_seen=/var/lib/apt/listchanges.db
which=news
EOL

# setup sudo
groupadd -r admin
usermod -a -G admin vagrant
cp /etc/sudoers /etc/sudoers.orig
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=admin' /etc/sudoers
sed -i -e 's/%admin ALL=(ALL) ALL/%admin ALL=NOPASSWD:ALL/g' /etc/sudoers

# Auto Login as root
cat >>/etc/gdm3/daemon.conf <<EOL
[daemon]
AutomaticLoginEnable = true
AutomaticLogin = root
EOL
echo "Define kali as Debian-based in /etc/issue"
sudo dd of=/etc/rc.local << EOF
#!/bin/sh -e
#
# rc.local
#
#/usr/bin/custom-issue.sh
echo "Debian GNU/Linux 7" > /etc/issue
exit 0
EOF
# Set up Vagrant.
date > /etc/vagrant_box_build_time


# Install vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
curl -Lo /home/vagrant/.ssh/authorized_keys \
  'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub'
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

sudo apt-get -o Dpkg::Options::="--force-confnew" dist-upgrade -yq
sudo apt-get -y -qq update
sudo apt-get -y -qq upgrade
sudo apt-get -y -qq install python-pip ansible open-vm-tools open-vm-tools-desktop fuse nfs-common linux-headers-$(uname -r)
sudo apt-get -y autoclean
sudo apt-get -y clean
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
sync