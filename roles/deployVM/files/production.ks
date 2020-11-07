#version=DEVEL
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
cdrom
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
network --bootproto=dhcp --activate --onboot=on --ipv6=auto --device=eth0
network  --hostname=production.webux.lab

#Root password
rootpw --plaintext SomeNotS3cureP455W0rd

#Initial user (user with sudo capabilities) 
# S3cOp3r4!0r
user itguy --name "itguy" --shell=/bin/bash --homedir=/home/itguy --iscrypted --password $6$WBJ3s1Z6YDNzLfiu$MgAp3oK6xiuVPMMNCE8VJk2jP6aFIeD3wAmfXngB.IaS7edrJ6ZqwgjSeOHKw9xru4XludkNxUVFj/mV8epnr/

firewall --enabled --ssh
selinux --enforcing

# System services
services --enabled="chronyd"

# System timezone
timezone America/Toronto --isUtc

# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda

# Partition clearing information
clearpart --all --initlabel --drives=vda

# Disk partitioning information
part / --fstype="xfs" --ondisk=vda --grow
part /boot --fstype="xfs" --ondisk=vda --size=1024
part /var/log/audit --fstype="xfs" --ondisk=vda --size=1024
part /var/log --fstype="xfs" --ondisk=vda --size=1024

reboot 

%packages
@^minimal
@core
chrony
kexec-tools
openscap
openscap-scanner
rsyslog
scap-security-guide

%end

%addon org_fedora_oscap
    content-type = scap-security-guide
    profile = xccdf_org.ssgproject.content_profile_standard
%end

%addon com_redhat_kdump --enable --reserve-mb='auto'

%end

%anaconda
pwpolicy root --minlen=6 --minquality=1 --notstrict --nochanges --notempty
pwpolicy user --minlen=6 --minquality=1 --notstrict --nochanges --emptyok
pwpolicy luks --minlen=6 --minquality=1 --notstrict --nochanges --notempty
%end

%post

yum install -y \
net-tools \
epel-release \
ansible \
wget \
git \
nano \
curl \
wget \
yum-utils

# Install Docker
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker

%end