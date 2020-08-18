# Generate SSL Certificate

Generate _client_ or _server_ or _ssl_ certificate

## Requirements

- CA certificate

## Role Variables

| Variable                     | Default values                |
| ---------------------------- | ----------------------------- |
| type                         | "server" \| "client" \| "ssl" |
| cert_name                    | ""                            |
| ca_certificate_name          | "changeme_CA"                 |
| certificate_directory        | "/srv/DATA/certificates/"     |
| ca_certificate_passphrase    | ""                            |
| domain_name                  | "local.lab"                   |
| cert_days                    | 730                           |
| cert_bits                    | 4096                          |
| cert_encryption              | "-sha256"                     |
| cert_country                 | "Changeme"                    |
| cert_state                   | "Changeme"                    |
| cert_locality                | "Changeme"                    |
| cert_organization            | "Changeme"                    |
| cert_organization_unit       | "Changeme"                    |
| cert_email_address           | "changeme@local.lab"          |
| certificate_expose_directory | "/tools/certificates/"        |
| alt_name                     | ""                            |
| web_server_path              | "/etc/nginx/ssl/"             |

## Dependencies

None

## Example Playbook

```yaml
---
- name: Generate PFSense Server certificate
  hosts: physical
  become: yes

  vars_prompt:
    - name: "ca_certificate_passphrase"
      prompt: "Passphrase"
      private: yes

  vars:
    type: "server" # server | client | ssl
    cert_name: "fw"
    ca_certificate_name: "changeme_CA"
    certificate_directory: "/srv/DATA/certificates/"
    ca_certificate_passphrase: ""
    domain_name: "local.lab"
    cert_days: 730
    cert_bits: 4096
    cert_encryption: "-sha256"
    cert_country: "Changeme"
    cert_state: "Changeme"
    cert_locality: "Changeme"
    cert_organization: "Changeme"
    cert_organization_unit: "Changeme"
    cert_email_address: "changeme@local.lab"
    certificate_expose_directory: "/tools/certificates/"
    alt_name: "fw.local.lab"

  roles:
    - { role: roles/generateCertificate }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
