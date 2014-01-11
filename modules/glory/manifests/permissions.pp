class glory::permissions {
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
        # IP bans
        'essentials.banip':;
        'essentials.unbanip':;
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
        # User information
        'essentials.whois':;
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
        # Basic TP commands
        'essentials.home':;
        'essentials.sethome':;
        'essentials.back':;
    }

    # Log everyone in prism
    permissions::global_forbid {
        'prism.ignore.tracking.*':;
    }

    # Disable essentials economy entirely
    permissions::global_forbid {
        'essentials.balance':;
        'essentials.balance.others':;
        'essentials.balancetop':;
        'essentials.eco':;
        'essentials.eco.loan':;
        'essentials.pay':;
        'essentials.sell':;
        'essentials.setworth':;
        'essentials.worth':;
    }

    # Disable socialspy due to ethical concerns
    permissions::global_forbid {
        'essentials.socialspy':;
        'essentials.socialspy.others':;
    }
    
    # Disable some annoying auto-features, including for admins
    permissions::global_forbid {
        'essentials.mail':;
        'essentials.mail.send':;
        'essentials.mail.sendall':;
        'essentials.afk':;
        'essentials.afk.kickexempt':;
        'essentials.afk.others':;
        'essentials.afk.auto':;
    }
}
