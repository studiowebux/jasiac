# Utilities

 a bunch of tools for Linux

## Requirements

None

## Role Variables

None

## Dependencies

None

## Example Playbook

```yaml
- name: Install Utilities
  hosts: physical
  become: yes
  roles:
    - { role: roles/utilities }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
