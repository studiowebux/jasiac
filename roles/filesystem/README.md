# File System

It prepares the extra and docker drives to hold all the data for the internal usage.

## Requirements

- At least 1 drive available to be wiped and used for DATA and DOCKER
- If you use only one drive, keep in mind, that the drive will have a high I/O
- It is better to use 2 drives even more. (But this script supports only 2 drives)

## Role Variables

| Variable     | Default values |
| ------------ | -------------- |
| DATA_drive   | "md0"          |
| DOCKER_drive | "sdb"          |
| wipe_disks   | no             |

## Dependencies

None

## Example Playbook

```yaml
- name: Configure Filesystem
  hosts: physical
  become: yes
  roles:
    - { role: roles/filesystem }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
