# Create Certificate Authority

It creates a certificate authority.

## Requirements

None

## Role Variables

| Variable                     | Default values            |
| ---------------------------- | ------------------------- |
| certificate_directory        | "/srv/DATA/certificates/" |
| ca_certificate_name          | "changeme_CA"             |
| ca_certificate_passphrase    | ""                        |
| ca_days                      | 1825                      |
| ca_bits                      | 4096                      |
| ca_encryption                | "-sha256"                 |
| ca_country                   | "Changeme"                |
| ca_state                     | "Changeme"                |
| ca_locality                  | "Changeme"                |
| ca_organization              | "Changeme"                |
| ca_organization_unit         | "Changeme"                |
| ca_common_name               | "changeme.local.lab"      |
| ca_email_address             | "changeme@local.lab"      |
| certificate_expose_directory | "/tools/certificates/"    |

## Dependencies

None

## Example Playbook

```yaml
- name: Create a certificate authority
  hosts: physical
  become: yes

  vars_prompt:
    - name: "ca_certificate_passphrase"
      prompt: "Passphrase"
      private: yes

  roles:
    - { role: roles/createCertificateAuthority }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
