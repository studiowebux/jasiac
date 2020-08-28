# Verdaccio

## Configure the client Certificate

Set the certificate globally,

```bash
sudo npm config set -g cafile local_CA.pem
```

DO NOT RUN THIS command:

> This is not safe to disable this verification

```bash
npm config set strict-ssl false
```

## Create a new user

```bash
tgingras@computer Downloads % sudo npm config set -g cafile local_CA.pem
tgingras@computer Downloads % npm adduser --registry https://npm.local.lab

Username: tgingras
Password:
Email: (this IS public) tommy@webuxlab.com
Logged in as tgingras on https://npm.local.lab/.
```
