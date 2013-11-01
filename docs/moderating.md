Moderator Guide
===============

*Power corrupts, moderator power corrupts moderately.*

Moderator Guidelines
--------------------

1. Your powers are a last resort: except in cases of grief repairs, your powers should not be used if alternative mediation is available.
2. A soft touch is often better than a crackdown. "Speak softly but carry a big stick" (unless you're dealing with griefing, see below).
3. Do not use extra powers to give yourself a gameplay advantage.
4. Community leadership and leading by example are more important than enforcing the rules.
5. Disagreements should be kept private. Issues with other moderators, or administrators should not be discussed in public.

Mod/Admin Chat
--------------

The mod and admin chat is available at https://neffy.hipchat.com/chat. You should have received an invite to this, if you didn't then please contact one of the admins.

Bans
----

Rule 1 notwithstanding, your basic tool against those who are damaging the server is the ban hammer. Essentially there are only three commands to know about here:

* `/kick <player> <message>` will forcibly disconnect a user from the server with a kick message.
* `/ban <player> <message>` will ban a user from the server with a given message. Please explain the reason for their ban in the message, this is for staff reference as much as anything else.
* `/unban <player>` will remove a ban from a player and allow them once again to connect to the server.

In some Minecraft servers, there is the option of banning players by IP address rather than username. This is disabled here, but if you do find a way to circumvent this, be warned that it is a **very bad idea**. Due to the way the server is set up, every single user will appear to come from the same IP address, and banning that IP will make it impossible for anyone to connect to the server until an admin can fix it at the console.

Monitoring
----------

In case of suspected rule-breakers, it may well be useful to actually just keep an eye on them to establish exactly what is going on rather than moving in without evidence. The `/vanish` command allows you to become physically invisible to all users, and watch people without alerting them to your presence.

You have access to a number of basic teleportation commands to move around the map for moderation purposes.

* `/tp <player>` allows you to teleport directly to the current position of a player.
* `/tppos <x> <y> <z>` allows you to teleport to a particular position.

Handling Griefers
-----------------

If you find that someone is actively griefing before your very eyes, your first priority is to stop them. This takes precedence over the normal soft-touch approach. Kicks and bans to keep them away while you repair damage are not unreasonable, and it is left to your judgement whether to unban afterwards and allow them to return to be spoken to or just to remove them from the server.

As a rule of thumb, players we know who decide to grief should be allowed back to be asked not to do so again unless they have griefed before; a new player who arrives just to grief is probably a good candidate for an outright immediate ban unless anyone speaks up in their defence.

Prism Logs
----------

[Prism](http://discover-prism.com/) is the block-logging plugin that we use. Almost anything that one can do to interact with the world will be recorded in a database to be inspected in future and, potentially, reverted.

Most of prism falls under the `/prism` command, which may be abbreviated as `/pr`.

A good place to start with Prism is `/pr near`, or `/pr near <radius>`, which will show you a list of changes within that area. If there is more than one page of results (likely around anywhere built-up), you can use `/pr page <number>` or `/pr page next` and `/pr page prev` to scroll through.

For slightly finer grained control, you can use the Prism wand, which is a tool that lets you click on a block to get the logs for that particular location, or right click on a block face to get the logs for the location the block is facing. You can think of it as if you are holding a block -- left-clicking on a block gives you the log for the block you would be breaking, right-clicking on a block gives you the log for the location where you would be placing a block.

To toggle the prism wand, use `/pr i` (with `i` shorthand for "inspection").

For more complex lookups, the full database can be queried with `/pr l <params>`. The parameters are quite flexible and too long to document here, if you need to use this tool then Prism's [own documentation](http://discover-prism.com/wiki/view/parameters/) is the place to search.

Finally, you will notice a number associated with each action. You can teleport to the location of any logged action with `/pr tp <index>`. You can also then scroll through with `/pr tp next` and `/pr tp prev`.

Rollbacks
---------

If a griefer has actually done damage, you can roll back specific actions with Prism.

As a start, you have two basic tools from Prism in the form of `/pr drain <radius>` and `/pr ex <radius>` which will respectively drain liquids and put out fires within that radius.

To roll back a specific set of actions, you specify which actions to roll back via parameters, documented below. You can then use `/pr preview rollback <params>` to preview the effects that your rollback will have, and if you are satisfied then use `/pr preview apply` to apply that rollback, or use `/pr preview cancel` to prevent the changes from happening.

It is possible to apply rollbacks without preview, but not recommended.

### Parameters

You can specify any number of these, and those actions which satisfy all the parameters will be considered.

There are a huge number of parameters which you can use, with the full list documented [on Prism's website](http://discover-prism.com/wiki/view/parameters/), but here we will go into only the basic few.

* `r:<radius>` constrains actions to only those within a given radius from your current position. This defaults to 20. `r:global` removes this restriction and will apply rollbacks to the entire world, use with extreme caution.
* `before:<time>` constraints actions to those which occurred before `<time>` long ago. As an example, `before:1d4h` will return only those actions which occurred more than 28 hours ago.
* `since:<time>` works much like `before`, but inverted: only those actions which occurred since `<time>` ago are returned.
* `p:<player>` yields only those actions performed particularly by a given player. You can also invert that logic with `!`: for instance `p:!Dinnerbone` will yield actions performed by anyone other than Dinnerbone.

Client Hacks
------------

Occasionally, players will use client-side hacks, which are against the server's rules. The most basic client-side hack is the X-Ray pack.

X-ray packs allow one to see ores in the distance and thus be able to mine directly to them rather than discovering them in the normal fashion. To some extent, we already combat this. The server wrapper that we use, [Spigot](http://www.spigotmc.org/), includes ore obfuscation. Essentially what this means is that ores that you cannot directly see will appear as stone, so X-ray texture packs will not reveal any ores.

Unfortunately, X-ray packs are far from the worst hacking that clients can do -- that would fall to some of the nastier features of the Nodus custom Minecraft client. We counter Nodus with a Minecraft plugin called [NoCheatPlus](http://dev.bukkit.org/bukkit-plugins/nocheatplus/). NoCheatPlus, or NCP, is far less forgiving than the normal Minecraft server, and will block client-side actions it does not expect as well as warning online admins and moderators of what it has done.

Now, these warnings are not always indicators of malicious clients. In fact, there are quite a few false positives caused by lag. Generally these will be warnings for fast block breaking, fast healing, or other "fast" actions. If you see one or two of these, particularly from a number of players, ignore them. If it's being a nuisance to someone who you feel confident is not using client-side hacks, you can exempt them from checks for the rest of their session with `/ncp exempt <player>`.

If, however, you get a lot of messages from a particular player, particularly unusual messages such as the improbability check, they may well be using a hacked client. Confronting them about it is wise, as they may well have an intention to grief the server.

Stealing
--------

Occasionally, accusations of stealing will fly. These can be some of the worst to deal with, because the discussions get very heated and people get quite upset. Luckily, there are tools help deal with this.

The first thing to remember is that Prism logs pretty much *everything*. That includes access to chests. You can get Prism logs from a chest showing who accessed it and when. As mentioned in the section of Prism, you can also filter down the logs to players excluding the chest's owner.

There is a command called `/invsee <player>' which will let you look at any player's current inventory.

If you do find that stealing has taken place, a few words to the wise to the first time offender will usually suffice. For repeat offenders, you may have to resort to more drastic measures -- as always, if unsure then give the admins a shout to resolve disputes.

