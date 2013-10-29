Dedicated Glory
===============

It is possible to run Glory on a dedicated server. These are the install steps.

1. Set up a generic admin account as the first user account on the target machine (a recent Debian or Ubuntu).
2. Get up-to-date packages with `apt-get update`.
3. Using `apt-get install`, install:
  1. `puppet`
  2. `git`
  3. `unzip`
  4. `ruby-hiera`
4. Clone the Glory repository (`git clone https://github.com/prophile/glory`) and `cd` into it.
5. Write the `settings.yaml` file as per usual.
6. Run `./prepare.sh`.
7. Run `sudo puppet apply --modulepath=modules manifests/base.pp`.

Updates
-------

To run a system update:

1. `apt-get update` for the latest package list.
2. `apt-get upgrade` for the latest system packages.
3. `cd` into the Glory directory.
4. `git pull --ff-only`.
5. `./prepare.sh`.
6. `sudo puppet apply --modulepath=modules manifests/base.pp`.
