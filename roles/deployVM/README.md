# Deploy VM

It creates a VM using libvirt and launch it.

## Requirements

- libvirt

## Role Variables

| Variable        | Default values | Mandatory |
| --------------- | -------------- | --------- |
| iso_destination | ""             | Yes       |
| iso_filename    | ""             | Yes       |
| iso_url         | ""             | Yes       |
| volume          | ""             | Yes       |
| kickstart_name  | ""             | No        |
| kickstarts_dir  | ""             | No        |
| vm_name         | ""             | Yes       |
| ram             | ""             | Yes       |
| vcpus           | ""             | Yes       |
| os_variant      | "generic"      | No        |
| graphics        | "vnc"          | No        |
| autostart       | "yes"          | No        |
| networks        | Empty Array    | Yes       |
| disks           | Empty Array    | Yes       |

## Dependencies

None

## Example Playbook

It deploy 3 differents VM using one playbook.

```yaml
---
- name: Deploy all VMs
  hosts: physical
  become: yes

  vars:
    vms:
      - iso_url: "http://mirror2.evolution-host.com/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-Minimal-2003.iso"
        iso_filename: "CentOS-7-x86_64-Minimal-2003.iso"
        iso_destination: "/ISO/centos/7.8.2003/"
        volume: "/srv/DATA/virtual_machines/AnsibleTest20/"
        kickstarts_dir: "/srv/DATA/pxe/kickstarts"
        kickstart_name: "AnsibleTest20.ks"
        vm_name: "AnsibleTest20"
        ram: 1024
        vcpus: 2
        os_variant: "generic"
        graphics: "vnc"
        networks:
          - "network=INTERNAL_TRUNK,model=virtio"
        disks:
          - "path=/srv/DATA/virtual_machines/AnsibleTest20/disk_01.qcow2,size=20,bus=virtio,format=qcow2"
        autostart: "no"
      - iso_url: "http://mirror2.evolution-host.com/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-Minimal-2003.iso"
        iso_filename: "CentOS-7-x86_64-Minimal-2003.iso"
        iso_destination: "/ISO/centos/7.8.2003/"
        volume: "/srv/DATA/virtual_machines/AnsibleTest30/"
        kickstarts_dir: "/srv/DATA/pxe/kickstarts"
        kickstart_name: "AnsibleTest30.ks"
        vm_name: "AnsibleTest30"
        ram: 1024
        vcpus: 1
        os_variant: "generic"
        graphics: "vnc"
        networks:
          - "network=INTERNAL_TRUNK,model=virtio"
          - "network=WAN,model=virtio"
        disks:
          - "path=/srv/DATA/virtual_machines/AnsibleTest30/disk_01.qcow2,size=20,bus=virtio,format=qcow2"
          - "path=/srv/DATA/virtual_machines/AnsibleTest30/disk_02.qcow2,size=20,bus=virtio,format=qcow2"
        autostart: "yes"
      - iso_url: "https://dl.greenbone.net/download/VM/gsm-ce-6.0.7.iso"
        iso_filename: "gsm-ce-6.0.7.iso"
        iso_destination: "/ISO/openvas/"
        volume: "/srv/DATA/virtual_machines/OpenVAS_test/"
        vm_name: "OpenVAS"
        ram: 4096
        vcpus: 4
        os_variant: "generic"
        networks:
          - "network=WAN,model=virtio"
        graphics: "vnc"
        disks:
          - "path=/srv/DATA/virtual_machines/OpenVAS_test/disk_01.qcow2,size=80,bus=sata,format=qcow2"

  tasks:
    - name: Deploy VMs
      include_role:
        name: roles/deployVM
      vars:
        iso_destination: "{{ item.iso_destination }}"
        iso_filename: "{{ item.iso_filename }}"
        iso_url: "{{ item.iso_url }}"
        volume: "{{ item.volume }}"
        kickstart_name: "{{ item.kickstart_name | default('') }}"
        kickstarts_dir: "{{ item.kickstarts_dir | default('') }}"
        vm_name: "{{ item.vm_name }}"
        ram: "{{ item.ram }}"
        vcpus: "{{ item.vcpus }}"
        os_variant: "{{ item.os_variant }}"
        graphics: "{{ item.graphics }}"
        networks: "{{ item.networks }}"
        disks: "{{ item.disks }}"
        autostart: "{{ item.autostart }}"
      loop: "{{ vms }}"
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
