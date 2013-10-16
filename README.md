Glory
=====

Installing
----------

1. Run `./prepare.sh`
2. Select your config. For the live server this is 'glory'
3. Enter the config password
4. Run `vagrant up`

Updating
--------

1. Run `git pull`
2. Rerun `./prepare.sh` - you will not be prompted for the password
3. Run `vagrant provision`

Starting and stopping the VM
----------------------------

After install, run `vagrant halt` to stop the VM, or `vagrant up` to
start it.

Getting In
----------

`vagrant ssh` gives an SSH terminal on the VM, as the `vagrant`
user. Minecraft runs as the user `minecraft`.

The server console can be accessed via `mark2 attach`.

The MC server can be stopped and started with `sudo /etc/init.d/minecraft
stop|start|restart`.

Backups
-------

Hourly backups are stored in /home/minecraft/backups. Long-term backups
are stored on S3.

A backup can be restored from the tar.gz with mc-restore [path].

Configuration
-------------

The staff lists are part of the git repo, and are in
modules/staff/manifests/init.pp. Rerun `vagrant provision` after changing.

Public server configuration details are in
modules/glory/manifests/init.pp. Rerun `vagrant provision` after changing.

Private server details (the level seed, and various passwords) are stored
in the secrets file.

The Secrets File
----------------

The secrets file, modules/secrets/manifests/init.pp, contains root
passwords and the level seed. This is privileged information.

As a result, it is not stored in git - an encrypted version of it is.

It is decrypted as part of the prepare process. To decrypt it afresh,
run `scripts/decrypt.sh`.

After changes, to encrypt again so it can be included in the repo, run
`scripts/encrypt.sh`.

