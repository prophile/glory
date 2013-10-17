import sys, yaml

TARGET = '.'

with open("{}/admins.txt".format(TARGET)) as f:
    admins = [adm.strip() for adm in f if adm]
with open("{}/mods.txt".format(TARGET)) as f:
    mods = [mod.strip() for mod in f if mod]
with open("{}/mod_permissions.txt".format(TARGET)) as f:
    mperms = [perm.strip() for perm in f if perm]
with open("{}/user_permissions.txt".format(TARGET)) as f:
    uperms = [perm.strip() for perm in f if perm]

groups = {}
users = {}

# General users group
groups['default'] = {'default': True, 'permissions': uperms}
# Mods group
groups['mods'] = {'permissions': mperms}
# Admins group
groups['admins'] = {'permissions': ['*']}

for adm in admins:
    users[adm] = {'group': ['admins']}
for mod in mods:
    users[mod] = {'group': ['mods']}

with open("{}/plugins/PermissionsEx/permissions.yml".format(TARGET), "w") as f:
    yaml.dump({"groups": groups, "users": users}, f)

