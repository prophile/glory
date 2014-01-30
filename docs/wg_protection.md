WorldGuard Protection
=====================

For core pieces of server infrastructure, it is necessary to apply protections to prevent their being modified, deliberately or otherwise, by players.

Protecting a Region
-------------------

The procedure for region protection is as follows:

1. Select the region using WorldEdit. Include a few blocks around the region to be protected.
2. Create the region with `/region define <name>`. The names are documented below.
3. Set the region protections. Player modification protection is enabled by default.
  1. `/region flag <name> creeper-explosion deny` (for spawn and portals)
  2. `/region flag <name> enderman-grief deny` (for spawn and portals)
  3. `/region flag <name> ghast-fireball deny` (for spawn and portals)
  4. `/region flag <name> tnt deny` (for spawn and portals)
  5. `/region flag <name> lighter deny` (for spawn and portals)
  6. `/region flag <name> mob-spawning deny` (for spawn only)
  7. `/region flag <name> farewell Now leaving spawn.` (for spawn only)

Names
-----

The spawn protection region takes the name `infr_spawn`.

Portals take the name `infr_portal_<name>_overworld` and `infr_portal_<name>_nether` for the two ends. <name> is just a reference name for the portal: the spawn one should be called spawn.

PVP Regions
-----------

TODO: Document this as and when.
