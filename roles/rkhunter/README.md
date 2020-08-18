# RKHunter

It install and configures RKHunter on Linux.

## Requirements

None

## Role Variables

| Variable | Default values       |
| -------- | -------------------- |
| hostname | "changeme.local.lab" |
| email    | "tommy@webuxlab.com" |

## Dependencies

None

## Example Playbook

```bash
- name: Install and Configure RKhunter
  hosts: tests
  become: yes
  roles:
    - { role: roles/rkhunter }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
