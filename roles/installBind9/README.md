# Install Bind9 (named)

Install and configure bind9.

## Requirements

- Configure the network properly.

## Role Variables

| Variable               | Default values                              |
| ---------------------- | ------------------------------------------- |
| interface_ipv4         | "192.168.10.0/24"                           |
| interface_ipv6         | "2001:db8:0:10::/64"                        |
| search_domain          | "webux.lab"                                 |
| interface_ipv4_revzone | "10.168.192.in-addr.arpa"                   |
| interface_ipv6_revzone | "0.1.0.0.0.0.0.0.8.b.d.0.1.0.0.2.ip6.arpa." |

## Dependencies

None

## Example Playbook

```yaml
- name: Install abnd configure bind9
  hosts: physical
  become: yes
  roles:
    - { role: roles/installBind9 }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
