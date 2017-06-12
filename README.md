# docker-rsync

## Scripts

### skip-host-validation.sh

SSH checks the host when connecting. 
Because this image is for use in a script, there is no one to accept the host.
This script makes that all hosts are automatically accepted.
It adds the following to `~/.ssh/config`

```

Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null

```

### write-privkey.sh
Writes a private key to `~/.ssh/id_rsa`. 
The private key should be provided in the `PLUGIN_KEY` environment variable.

### add-ssh-config.sh
Writes a SSH config. 
It needs the `PLUGIN_CONFIG_NAME` and the `PLUGIN_CONFIG_OPTIONS` environment variables.
The `PLUGIN_CONFIG_NAME` is used as the name of the host.
The `PLUGIN_CONFIG_OPTIONS` should be a comma separated string with options for the host.

## Drone usage:

```
pipeline:
  rsync:
    image: pieterscheffers/docker-rsync
    pull: true
    secrets: [ plugin_key ]
    config_name: myhost
    config_options:
      - HostName example.org
      - User superman
      - Port 2222
    commands:
      - skip-host-validation.sh
      - write-privkey.sh
      - add-ssh-config.sh
      - rsync -a myhost:/home/username/dir1 dir2
```