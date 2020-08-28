# Install NFS Server

It install and configure the NFS Server.

## Requirements

None

## Role Variables

None

## Dependencies

- exportNFS

## Example Playbook

```yaml
- name: Install and Configure NFS Server
  hosts: physical
  become: yes
  roles:
    - { role: roles/installNFS }
```
## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
