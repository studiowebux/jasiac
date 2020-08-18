# SElinux

It configures SELinux in either **permissive** or **enforcing** mode.

## Requirements

- SELinux

## Role Variables

> Please do not use `disabled`, there is a lot of information online about how configuring SELinux !

| Variable    | Default values                |
| ----------- | ----------------------------- |
| wantedState | "permissive" [OR] "enforcing" |

## Dependencies

SELinux must be installed and running.

## Example Playbook

```yaml
- name: Configure SELinux
  hosts: physical
  become: yes
  roles:
    - { role: roles/selinux }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
