# System Structure

It creates the basic system structure

## Requirements

- The base directory structure.

## Role Variables

The `acl_for_storage` option is to configure `/storage` with an ACL to force the group to `nobody` with `777` permissions. That way all new files will be set to `nobody` with `777`. It allows to share files easily but this is less secure.

Default values:

```yaml
acl_for_storage: yes
docker_directories:
  - "{{ srv_DOCKER }}/data" ## To hold the docker data, instead of /var/lib/docker
  - "{{ srv_DOCKER }}/volumes" ## To hold the container volumes
data_directories:
  - path: "{{ srv_DATA }}/ISO" ## The ISO
    mode: "0775"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/images" ## The extracted ISO and Boot From LAN images
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot"
    mode: "0755"
    owner: root
    group: root
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv4"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv4/LEGACY"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv4/LEGACY/pxelinux.cfg"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv4/UEFI"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv4/UEFI/pxelinux.cfg"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv6"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv6/UEFI"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/ipv6/UEFI/pxelinux.cfg"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/tftpboot/netboot"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/ipxe" ## The iPXE Stuffs
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/kickstarts" ## The kickstarts Stuffs
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/pxe/scripts" ## The pre/post scripts
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/tools"
    mode: "0775"
    owner: nobody
    group: nobody
  - path: "{{ srv_DATA }}/tools/certificates"
    mode: "0755"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/storage"
    mode: "0777"
    owner: root
    group: nobody
  - path: "{{ srv_DATA }}/temp"
    mode: "0776"
    owner: nobody
    group: nobody
  - path: "{{ srv_DATA }}/virtual_machines"
    mode: "0770"
    owner: root
    group: qemu
  - path: "{{ srv_DATA }}/web_app"
    mode: "0744"
    owner: root
    group: root
  - path: "{{ srv_DATA }}/image_builder"
    mode: "0755"
    owner: root
    group: root
  - path: "{{ srv_DATA }}/certificates"
    mode: "0770"
    owner: root
    group: root
mount_points:
  - "/ISO"
  - "/images"
  - "/tftpboot"
  - "/storage"
  - "/tools"
  - "/temp"
bind_mounts:
  - from: "{{ srv_DATA }}/ISO"
    to: "/ISO"
  - from: "{{ srv_DATA }}/images"
    to: "/images"
  - from: "{{ srv_DATA }}/pxe/tftpboot"
    to: "/tftpboot"
  - from: "{{ srv_DATA }}/storage"
    to: "/storage"
  - from: "{{ srv_DATA }}/tools"
    to: "/tools"
  - from: "{{ srv_DATA }}/temp"
    to: "/temp"
```

## Dependencies

None

## Example Playbook

```yaml
- name: Configure system structure
  hosts: physical
  become: yes
  roles:
    - { role: roles/systemStructure }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
