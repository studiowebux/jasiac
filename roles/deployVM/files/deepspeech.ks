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
network --bootproto=dhcp --activate --ipv6=auto --device=eth0 --vlanid=10 --interfacename=eth0.10 
network  --hostname=javr.webux.lab

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
java-1.8.0-openjdk-devel
git
nano
net-tools

%end

%post

# Download Root Certificate and install it
mkdir /usr/share/ca-certificates/studiowebux
wget http://www.webux.lab/tools/certificates/local_CA.pem -O /usr/share/ca-certificates/studiowebux/local_CA.pem
openssl x509 -in /usr/share/ca-certificates/studiowebux/local_CA.pem -inform PEM -out /usr/share/ca-certificates/studiowebux/local_CA.crt
update-ca-certificates

# Clone Deepspeech
git clone https://github.com/studiowebux/deepspeech.git /home/javr/

# Install ansible
apt update
apt install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt install -y ansible

## ansible-playbook -i 192.168.10.30, --user root --ask-pass Scripts/Main.yaml --extra-vars='{"tensorflow_version": "r1.15","DeepSpeech_version": "tags/v0.8.0-alpha.2","bazel_version": "0.24.1"}'
## ansible-playbook -i 192.168., Scripts/SOX.yaml --ask-become --ask-pass
## ansible-playbook -i 192.168., Scripts/KENLM.yaml --ask-become --ask-pass --extra-vars '{"cores":12}'
## ansible-playbook -i 192.168., Scripts/SWIG.yaml --ask-become --ask-pass
## ansible-playbook -i 192.168., Scripts/BAZEL.yaml --extra-vars '{"bazel_version":"0.24.1"}' --ask-become --ask-pass
## ansible-playbook -i 192.168., Scripts/DEEPSPEECH.yaml --extra-vars '{"DeepSpeech_version":"tags/v0.8.0-alpha.2"}' --ask-become --ask-pass
## ansible-playbook -i 192.168., Scripts/TENSORFLOW.yaml --extra-vars '{"tensorflow_version":"r1.15"}' --ask-become --ask-pass
## ansible-playbook -i 192.168., Scripts/TS_DEEPSPEECH.yaml --extra-vars '{"cores":12}' --ask-become --ask-pass
## ansible-playbook -i 192.168., Scripts/Test.yaml --ask-become --ask-pass

%end