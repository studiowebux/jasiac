# SSH

It configures the SSH daemon using the configuration template available in this role.

## Requirements

Before using this role,

- Create an account with sudo right (preferably).
- Generate an SSH pub/priv key before launching this role.
- The password authentication is enabled by default for all, except the `root` user (To increase the security, you should disable the password authentication)

## Role Variables

| Variable               | Default values |
| ---------------------- | -------------- |
| passwordAuthentication | "yes"          |
| sshPort                | 22             |

## Dependencies

None

## Example Playbook

```yaml
- name: Configure SSHd
  hosts: physical
  become: yes
  roles:
    - { role: roles/ssh }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
