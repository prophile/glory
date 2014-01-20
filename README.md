Glory
=====

Installing
----------

1. Write a `settings.yaml` - there is an example in `settings.yaml.example`
2. Run `./prepare.sh`
3. Run `vagrant up`

Updating
--------

1. Run `git pull`
2. Rerun `./prepare.sh`
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

Periodic backups are stored in `/home/minecraft/backups`. Long-term backups
are stored on S3.

A backup can be restored from the tar.gz with `mc-restore [path]`.

Configuration
-------------

Public server configuration details are in
`modules/glory/manifests/init.pp`. Rerun `vagrant provision` after changing.

Private server details (the level seed, and various passwords) as well as
the staff list are stored in `settings.yaml`.

