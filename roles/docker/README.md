# Docker and docker-compose

It install and configures Docker and docker-compose on CentOS / RHEL

## Requirements

- CentOS or RHEL

After installing docker, you have to add the wanted users in the docker group, like this:
`sudo usermod -aG docker [your-user]`

## Role Variables

| Variable       | Default values                                                                                 |
| -------------- | ---------------------------------------------------------------------------------------------- |
| srv_DOCKER     | "/srv/DOCKER"                                                                                  |
| docker_network | "--default-address-pool base=172.24.0.0/13,size=24"                                            |
| composeURL     | "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-\\\\\$(uname -s)-\$ | (uname -m)" |
| dockerRepoURL  | "https://download.docker.com/linux/centos/docker-ce.repo"                                      |

## Dependencies

None

## Example Playbook

```yaml
- name: Install, Configure Docker and docker-compose
  hosts: docker
  become: yes
  roles:
    - { role: roles/docker }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
