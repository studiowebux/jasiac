#
#Generic Kickstart template for Ubuntu
#Platform: x86 and x86-64
#

#System language
lang en_US

#Language modules to install
langsupport en_US

#System keyboard
keyboard us

#System mouse
mouse

#System timezone
timezone America/New_York

#Root password
rootpw --disabled

#Initial user (user with sudo capabilities) 
user javr --fullname "javr" --password P455word

#Reboot after installation
reboot

#Use text mode install
text

#Install OS instead of upgrade
install

#Installation media
cdrom

#System bootloader configuration
bootloader --location=mbr 

#Clear the Master Boot Record
zerombr yes

#Partition clearing information
clearpart --all --initlabel 

#Basic disk partition
part / --fstype ext4 --size 1 --grow --asprimary 
part swap --size 1024 
part /boot --fstype ext4 --size 1024 --asprimary 


#System authorization infomation
auth  --useshadow  --enablemd5 

#Network information
network --bootproto=static --ip=192.168.10.32 --netmask=255.255.255.0 --gateway=192.168.10.1 --nameserver=192.168.10.1 --activate --ipv6=auto --device=eth0 --vlanid=10 --interfacename=eth0.10 
network  --hostname=staging.webux.lab

#Firewall configuration
firewall --disabled --trust=eth0 --ssh 

#Do not configure the X Window System
skipx

%packages
@^minimal
@core
chrony
kexec-tools
epel-release
ansible
wget
git
nano
net-tools
yum-utils

%end

%post

# Download Root Certificate and install it
wget http://www.webux.lab/tools/certificates/local_CA.pem -O /etc/pki/ca-trust/source/anchors/local_CA.pem && \
update-ca-trust


# Install Docker
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker

%end