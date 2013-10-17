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
        'prism.*':;
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

