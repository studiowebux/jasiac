# Backup

## Incremental

```yaml
  vars:
    backupServer: "192.168.200.170"
    backupPath: "/mnt/Backup"
    recipient: "tommy@studiowebux.com"
    serverName: "eldir"
```

Copy the `incremental.yml` script directly to the server.

```bash
ansible-playbook -i 127.0.0.1 incr.yml --user tgingras --ask-pass --ask-become --become
```