# Staging VM

This VM have a docker to host our applications in staging

# Usage and deployment

> From your ansible deployment host

```bash
ssh-copy-id root@staging.webux.lab
```

```bash
ansible-playbook -i inventory/ vm/staging/01_filesystem.yml --user root
```

```bash
ansible-playbook -i inventory/ vm/staging/02_file_structure.yml --user root
```

```bash
ansible-playbook -i inventory/ 07_install_docker.yml --user root
```

> From there you have Docker installed and ready to deploy new Application
