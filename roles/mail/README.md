# Mail

It install and configures the requirements to use an external email provider.
I've only tested the `Sendgrid` integration to send email from Linux using the `mail` command.

## Requirements

This role has been tested only with `Sendgrid`, but I do not see issues if you want to use another providers.

## Role Variables

| Variable       | Default values          |
| -------------- | ----------------------- |
| url_port       | "smtp.sendgrid.net:587" |
| user           | "apikey"                |
| test_recipient | "tommy@studiowebux.com" |

## Dependencies

None

## Example Playbook

```yaml
- name: Install and Configure mail with sendgrid
  hosts: physical
  become: yes

  vars_prompt:
    - name: "sendgrid_password"
      prompt: "Sendgrid API Password"
      private: yes

  roles:
    - { role: roles/mail }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
