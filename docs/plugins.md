Adding Plugins
==============

To add a new plugin to the system:

1. Add a module for the plugin. Copying an existing module and changing the
   names is usually the easiest way of doing this (e.g. by copying WorldEdit).
2. Add a jar download to `scripts/download-deps.sh`. If the download comes as a
   zip, follow the example in the Essentials module on how to unpack it.
3. Add permissions, if appropriate.
4. Add an include into `modules/glory/manifests/init.pp`. This actually includes
   the module in the provision process.

Adding Permissions
------------------

Permissions live in the file `modules/staff/manifests/init.pp`. They are separated
into two separate groups: mod permissions and user permissions.
