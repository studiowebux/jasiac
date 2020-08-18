# libvirt Network

It configures the bridges for libvirt

## Requirements

- libvirt
- Network configured
- Bridge configured

## Role Variables

Default values:

```yaml
networks:
  - fn: INTERNAL_TRUNK
    bridge_name: br0
  - fn: WAN
    bridge_name: br2
```

## Dependencies

None

## Example Playbook

```yaml
- name: Configure libvirt Network
hosts: physical
become: yes
roles:
  - { role: roles/libvirtNetwork }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
