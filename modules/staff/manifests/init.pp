class staff {
    permissions::admin {
        'nfreader':;
        'adminphile':;
    }

    permissions::mod {
        'prophile':;
        'mud212':;
        'mrxak':;
    }

    permissions::mod_permission {
        # Full prism access
        'prism.*':;
        # Ban system access
        'essentials.unban':;
        'essentials.ban.notify':;
        'essentials.tempban':;
        'essentials.tempban.offline':;
        'essentials.mute':;
        'essentials.mute.notify':;
        'essentials.kick':;
        'essentials.kick.notify':;
        'essentials.ban':;
        # Announcements
        'essentials.broadcast':;
        'bukkit.command.say':;
        # Inventory administration
        'essentials.clearinventory':;
        'essentials.clearinventory.others':;
        'essentials.invsee':;
        # Vanish
        'essentials.vanish':;
        # TP access
        'essentials.tp':;
        'essentials.tp.others':;
        'essentials.tphere':;
        'essentials.tppos':;
        # Server information
        'bukkit.command.tps':;
        # WorldEdit grief recovery tools
        'worldedit.extinguish':;
        # NCP information
        'nocheatplus.notify':;
        'nocheatplus.shortcut.safeadmin':;
        # Fire handling via WorldGuard
        'worldguard.fire-toggle.*':;
    }

    permissions::user_permission {
        # Essentials commands that do not give out extra information
        'essentials.compass':;
        'essentials.depth':;
        'essentials.getpos':;
        'essentials.itemdb':;
        'essentials.list':;
        'essentials.motd':;
        'essentials.seen':;
        'essentials.rules':;
        'essentials.recipe':;
        # Potentially useful
        'essentials.suicide':;
        'essentials.ping':;
        # Private messaging, and public messaging
        'essentials.ignore':;
        'essentials.me':;
        'essentials.msg':;
        'essentials.msg.url':;
        # Help pages
        'essentials.help':;
    }
}

