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
network --bootproto=static --activate --device=eth0 --ip=192.168.10.35 --netmask=255.255.255.0 --gateway=192.168.10.1 --nameserver=192.168.10.10,192.168.10.1 --vlanid=10 --interfacename=eth0.10
network --bootproto=dhcp --activate --device=eth0
network  --hostname=test2.webux.lab

# Root password
rootpw --iscrypted $6$l3DcBjheFFULZOAX$bB/E36dFwTCGxCS95FRWIERyOJkUrNImvucdWfY19jR0x8uIlFJOm/Oo9MQXlmrxINkshKAT/Ec3isEoXpBHQ/
# System services
services --enabled="chronyd"
# System timezone
timezone America/Toronto --isUtc
# System bootloader configuration
bootloader --append=" crashkernel=auto" --location=mbr --boot-drive=vda
# Partition clearing information
clearpart --all --initlabel --drives=vda
# Disk partitioning information
part / --fstype="xfs" --ondisk=vda --size=1000 --grow
part /boot --fstype="xfs" --ondisk=vda --size=1024
part /var/log/audit --fstype="xfs" --ondisk=vda --size=1024
part swap --fstype="swap" --ondisk=vda --size=10240
part /var/log --fstype="xfs" --ondisk=vda --size=1024

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