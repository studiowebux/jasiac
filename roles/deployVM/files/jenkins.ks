#version=DEVEL

# System authorization information
auth --enableshadow --passalgo=sha512

# Use CDROM installation media
cdrom

# Disable Firewall
firewall --disabled

# Reboot after installation
reboot

# SELinux configuration
selinux --permissive

# Use graphical install
graphical

# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda

# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'

# System language
lang en_CA.UTF-8

# Network information
network --bootproto=static --activate --device=eth0 --ip=192.168.10.31 --netmask=255.255.255.0 --gateway=192.168.10.1 --nameserver=192.168.10.10,192.168.10.1 --vlanid=10 --interfacename=eth0.10
#network --bootproto=dhcp --activate --device=eth0 --ipv6=auto --vlanid=10 --interfacename=eth0.10
network  --hostname=jenkins-worker.webux.lab

# Root password
rootpw --iscrypted $6$fq6jY2dX.dVTCFPm$vkIbIQACiPzIdZ0wBYc5pQqUGqzMnkLPQiZI9LqiAkbO5dlzW9wseMTx7LSRys7Uzl4Lw5lwZ40Rnuwnntdi91

# System services
services --enabled="chronyd"

# System timezone
timezone America/Toronto --isUtc

# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
autopart --type=lvm

# Partition clearing information
clearpart --all --initlabel --drives=vda

%packages
@^minimal
@core
chrony
kexec-tools
net-tools

%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

%post
# Install tools
yum install -y \
epel-release \
wget \
java-1.8.0-openjdk-devel \
git \
nano

# Download Root Certificate and install it
wget http://www.webux.lab/tools/certificates/studiowebux_CA.pem -O /etc/pki/ca-trust/source/anchors/studiowebux_CA.pem && update-ca-trust

# Install Jenkins
# Port 8080
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
systemctl enable jenkins

%end