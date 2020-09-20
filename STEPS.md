# Steps

## Install ansible on your remote system

## Connect the network and configure the switch/router

## Install the OS on the client using a USB key using the Kickstart

## Copy your public SSH key to the host

## Create the **first User** and the **admin group**

To generate the encrypted password, use this command :

```bash
python -c 'import crypt,getpass; print(crypt.crypt(getpass.getpass(), crypt.mksalt(crypt.METHOD_SHA512)))'
```

```bash
ansible-playbook -i inventory/ playbooks/first_user_and_group.yml --user root
```

Then, copy your ssh public id to the newly created user account.

## Launch the main.yml OR each playbook manually

```bash
ansible-playbook -i inventory/ main.yml --ask-become --user [USER]
```

## Configure **SSH** to **disable root access**

```bash
ansible-playbook -i inventory/ playbooks/ssh_configure.yml --ask-become --user tgingras
```

## Set **SELinux** in **permissive**|**enforcing** mode (**OPTIONAL**)

> This step should be run only if you have issues with it
> By default, SELinux is enabled and in enforcing mode
>  **DO NOT DISABLE SELINUX**

### For **_Enforcing_**

```bash
ansible-playbook -i inventory/ playbooks/selinux_configure.yml --user tgingras --ask-become -e wantedState=enforcing
```

### For **_Permissive_**

```bash
ansible-playbook -i inventory/ playbooks/selinux_configure.yml --user tgingras --ask-become
```

## Configure **Network**

> Use the `inventories/[mode]/host_vars/[host]` file to define your network configuration

```bash
ansible-playbook -i inventory/ playbooks/network_configure.yml --ask-become --user tgingras
```

To apply changes, launch `sudo reboot`

## Configure **mail** with **sendgrid**

> You need to have an account with sendgrid, otherwise you can change the variables to fit your provider

```bash
ansible-playbook -i inventory/ playbooks/mail_install.yml --user tgingras --ask-become
```

## Install and Configure **RKHunter**

```bash
ansible-playbook -i inventory/ playbooks/rkhunter_install.yml --user tgingras --ask-become
```

## Install and Configure **libvirt**

```bash
ansible-playbook -i inventory/ playbooks/libvirt_install.yml --user tgingras --ask-become
```

Then configure the network for libvirt

```bash
ansible-playbook -i inventory/ playbooks/libvirt_configure_network.yml --user tgingras --ask-become
```

## Create a **RAID 1** (Optional) (Not Published Yet)

```bash
ansible-playbook -i inventory/ playbooks/raid_create.yml --user tgingras --ask-become
```

## Create the **File System** for _Docker_ and _Data_ directories

> This step **will destroy data** if there is any on the drives defined in the configuration

> If the options `wipe_disks` is set to **yes|true** all the data will be automatically wiped.

```bash
ansible-playbook -i inventory/ playbooks/filesystem_configuration.yml --user tgingras --ask-become
```

## Create **System Structure**

```bash
ansible-playbook -i inventory/ playbooks/systemstructure_configuration.yml --user tgingras --ask-become
```

## Create **Certificate Autority**

```bash
ansible-playbook -i inventory/ playbooks/certificate_authority_create.yml --user tgingras --ask-become
```

## Install **Ansible**

```bash
ansible-playbook -i inventory/ playbooks/ansible_install.yml --user tgingras --ask-become
```

## Install **Utilities**

```bash
ansible-playbook -i inventory/ playbooks/utilities_install.yml --user tgingras --ask-become
```

## Deploy PFSense

```bash
ansible-playbook -i inventory/ playbooks/pfsense_deploy.yml --user tgingras --ask-become
```

Keep note of the VNC configuration:

```bash
<graphics type='vnc' port='5900' autoport='yes' listen='127.0.0.1'>
```

> The Vm will not be destroyed if already exist.

### To destroy the VM, you must do that manually:

```bash
virsh destroy --domain [VM_NAME]
virsh undefine --domain [VM_NAME] --remove-all-storage
```

### Generate certificates Server and Client

```bash
ansible-playbook -i inventory/ playbooks/pfsense_server_cert.yml --user tgingras --ask-become
```

```bash
ansible-playbook -i inventory/ playbooks/pfsense_user_cert.yml --user tgingras --ask-become
```

### Install PFSense manually using the VNC console

Using `VNC Viewer` and `port forwarding`, you can install the OS on the disk.

On MacOS:

```bash
ssh -L 127.0.0.1:5900:127.0.0.1:5900 -N [USER]@[HOST]
```

After the installation, you have to start the VM,

```bash
sudo virsh list --all
sudo virsh start fw
```

You can deploy a client VM to test the PFSense configuration if no external/physical resources are available.

```bash
ansible-playbook -i inventory/ playbooks/client_deploy.yml --user tgingras --ask-become
```

Then get the VNC port :

```bash
<graphics type='vnc' port='5901' autoport='yes' listen='127.0.0.1'>
```

On MacOS:

```bash
ssh -L 127.0.0.1:5901:127.0.0.1:5901 -N [USER]@[HOST]
```

### Reconfigure the network to use the PFSense instance to filter network traffics

> Be sure that your PFSense instance is running and is working as expected.
>  Otherwise, it is possible that you lost the remote access to the machine.

```bash
ansible-playbook -i inventory/ playbooks/network_edit.yml --user tgingras --ask-become
```

## Install and configure Bind9

In case you have issues with `yum` and `IPv6`

```bash
echo "ip_resolve=4" >> /etc/yum.conf
```

> Will be converted to docker container in the future : https://hub.docker.com/r/ventz/bind/

```bash
ansible-playbook -i inventory/ playbooks/bind9_install.yml --user tgingras --ask-become
```

## Install and configure **DHCP Server**

Will be converted to docker container in the future : https://github.com/networkboot/docker-dhcpd

```bash
ansible-playbook -i inventory/ playbooks/dhcpd_install.yml --user tgingras --ask-become
```

> The IPv6 implementation is available but not tested thoroughly.

## Install and configure **Nginx**

```bash
ansible-playbook -i inventory/ playbooks/nginx_install.yml --user tgingras --ask-become
```

## Install the **CA root certificate** on clients

```bash
ansible-playbook -i inventory/ playbooks/certificate_authority_install.yml --user tgingras --ask-become
```

## Install and configure **NFS Server**

```bash
ansible-playbook -i inventory/ playbooks/nfs_install.yml --user tgingras --ask-become
```

## Install and configure **SMB Server**

```bash
ansible-playbook -i inventory/ playbooks/smb_install.yml --user tgingras --ask-become
```

## Install and configure **Squid**

```bash
ansible-playbook -i inventory/ playbooks/squid_install.yml --user tgingras --ask-become
```

## Install and configure **OpenSCAP**

```bash
ansible-playbook -i inventory/ playbooks/openscap_install.yml --user tgingras --ask-become
```

## Deploy **all VMs**

```bash
ansible-playbook -i inventory/ playbooks/deploy_all_vms.yml --user tgingras --ask-become
```

## Configure each **VMs**

Mostly manual for now, there is yml available in the `vm/` directory, but configuation for most of the application are made using a web UI.

> The VM folder has multiple playbooks, you can use them to configure the VM.

## Install and configure **Docker**

```bash
ansible-playbook -i inventory/ playbooks/docker_install.yml --user tgingras --ask-become
```

## Deploy **containers** (Not Yet Published)

Use playbooks according to your needs.

Currently there is a lot of duplicates, I will refactor the directory in the future.

```bash
cd containers/
```

## Clients (script to deploy tools on clients)
- Install Zabbix Agent

## Backup Script

```bash
cd backup/
```

## Maintenance Scripts
- aureport
- openSCAP remediate
- Upgrade Linux systems