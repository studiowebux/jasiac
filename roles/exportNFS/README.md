# Export NFS Server shares

It exposes the NFS Server shares.

To update the shares, you can edit the template named `exports.j2`

## Requirements

- NFS server installed

## Role Variables

None

## Dependencies

None

## Example Playbook

```yaml
- name: Expose NFS Server shares
  hosts: physical
  become: yes
  roles:
    - { role: roles/exposeNFS }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
