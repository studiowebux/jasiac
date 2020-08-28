# Jenkins VM

This VM have a docker to host launch Jenkins jobs that requires docker.

# Usage and deployment

> From your ansible deployment host

```bash
ssh-copy-id root@jenkins-worker.webux.lab
```

```bash
ansible-playbook -i inventory/ vm/jenkins-worker/01_filesystem.yml --user root
```

```bash
ansible-playbook -i inventory/ vm/jenkins-worker/02_file_structure.yml --user root
```

```bash
ansible-playbook -i inventory/ vm/jenkins-worker/03_Install_utilities.yml --user root
```

```bash
ansible-playbook -i inventory/ 07_install_docker.yml --user root
```

> From there you have Docker installed and ready to deploy new Application
