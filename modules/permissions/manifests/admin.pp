define permissions::admin ()
{
  concat::fragment { "p_admin_$name":
    target  => "p_admins",
    content => "$name\n",
    notify  => Anchor['p_update'],
  }
}

