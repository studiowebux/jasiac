# Install Root Certificate

It install the root certificate on CentOS hosts.

## Requirements

- Have a certificate Authority deployed

## Role Variables

| Variable                     | Default values         |
| ---------------------------- | ---------------------- |
| certificate_expose_directory | "/tools/certificates/" |
| ca_certificate_name          | "local_CA"       |
| search_domain                | "webux.lab"            |

## Dependencies

None

## Example Playbook

```yaml
- name: Install the root certificate
  hosts: clients
  become: yes

  roles:
    - { role: roles/installRootCertificate }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
