# First User and Group

It creates a User and a Group on Linux.
Then the new user is added in the new group and also in the `wheel` group.

> The goal of this role is to create an itguy and an admin group on a newly installed Linux.

## Requirements

You have to provide a password hashed, you can use a command like this one :

```bash
python -c 'import crypt,getpass; print(crypt.crypt(getpass.getpass(), crypt.mksalt(crypt.METHOD_SHA512)))'
```

## Role Variables

| Variable   | Default values |
| ---------- | -------------- |
| username   | "itguy"     |
| groupname  | "admin_webux"  |
| comment    | "itguy"     |
| passphrase | "0perat0r"     |
| userID     | "1337"         |
| groupID    | "1338"         |

## Dependencies

None

## Example Playbook

```yaml
- name: Create first user and group
  hosts: physical
  remote_user: root
  become: yes

  vars_prompt:
    - name: username
      prompt: "What is your username ?"
      private: no

    - name: password
      prompt: "What is your password (encrypted) ?"

    - name: passphrase
      prompt: "What is your passphrase ?"

    - name: groupname
      prompt: "What is the admin group name ?"
      private: no

  roles:
    - { role: roles/first_user }
```

## License

MIT

## Author Information

Tommy Gingras @ Studio Webux S.E.N.C ([Webux Lab](https://webuxlab.com) - _A [Studio Webux](https://studiowebux.com) Project_)
