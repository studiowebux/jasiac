# Install Squid Server

It install and configures the squid server.

## Requirements

None

## Role Variables

| Variable       | Default values       |
| -------------- | -------------------- |
| interface_ipv4 | "192.168.10.0/24"    |
| interface_ipv6 | "2001:db8:0:10::/64" |

## Dependencies

None

## Example Playbook

```yaml
- name: Install and Configure Squid Server
  hosts: physical
  become: yes
  roles:
    - { role: roles/installSquid }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
