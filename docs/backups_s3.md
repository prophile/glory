Restoring backups from S3
=========================

Occasionally, it's necessary to restore a daily backup from S3.

The procedure is this.

1. Stop the Minecraft server.
2. `su` to the `minecraft` user.
3. Run `s3cmd ls <bucket>`. This will give a list of the available backups.
4. Copy the link from your selected backup.
5. `cd /tmp`.
6. `s3cmd get <link>`.
7. `mc-restore <file>` from the restored backup.
8. Start the Minecraft server.
