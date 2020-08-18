# Libvirt

It install libvirt on Linux.

## Requirements

None

## Role Variables

None

## Dependencies

None

## Example Playbook

```yaml
- name: Install and Configure libvirt
  hosts: physical
  become: yes
  roles:
    - { role: roles/libvirt }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
