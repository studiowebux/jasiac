# Install smb server

It install and configures the smb server.

## Requirements

None

## Role Variables

None

## Dependencies

None

## Example Playbook

```yaml
- name: Install and Configure smb Server
  hosts: physical
  become: yes
  roles:
    - { role: roles/installSMB }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
