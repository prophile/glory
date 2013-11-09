New World Procedure
===================

Occasionally, we create new worlds. This may be a major reset, or you might want to fork the server entirely.

Choosing A Seed
---------------

Firstly, one needs to select a seed. Generally, it's ideal if this meets the following properties:

* The origin - which will become spawn - is on a **plains** or similarly mostly flat biome;
* There's **ocean** very close to spawn (~100 blocks);
* There's **forest** - or similar treeful biome - within about 200 blocks of spawn;
* There's both **desert** and **snow** (taiga, tundra or similar) biomes within 600 blocks of spawn.

Other desirable, but not fundamental, attributes are mountains near spawn for the view, nearby villages, mushroom islands in the ocean, and in general, access to resources.

Setting Spawn
-------------

Once the map has generated, one needs to set the spawn location. This is just a matter of travelling to the origin by whatever means and running `/setspawn`.

Filling The World
-----------------

The three worlds, `world`, `world_nether` and `world_the_end`, will by default generate chunks on demand. Since we use WorldBorder to set well-defined boundaries to the world, it's beneficial to pregenerate the entire world. Luckily, WorldBorder can do this.

Run `wb <world> fill` to set up the fill for each world, followed by `wb fill confirm` to start the fill.

Mushroomising Spawn
-------------------

It is convenient for spawn to be located within land tagged with the MushroomIsland biome, although - of course - it is not an actual mushroom island. Hostile mobs do not spawn naturally within mushroom islands, and frankly bright green lawns in spawntown look pretty. WorldEdit provides `//setbiome` which can do this.

Nether Portals
--------------

In the normal Glory setup, we do not allow users to create their own nether portals. In fact nether portal creation is disabled as part of Essentials.

To temporarily enable nether portals in order to light them up, edit Essentials's config file and, in the `protect/prevent` section, set `portal-creation` to `false` (which turns off its prevention by Essentials). `/ess reload` in the client will cause Essentials to reload its configuration file.

Obviously it is a very good idea to turn the protection back on once you are done.

Once the portal is open, both ends need to be protected with WorldGuard. Use the procedure in `wg_protection.md` for this purpose.

Spawn Protection
----------------

In order to prevent spawn being griefed or damaged by mobs, it is wise to protect it with WorldGuard. The procedure is documented in `wg_protection.md`.
