define permissions::admin ()
{
  concat::fragment { "p_admin_$name":
    target  => "p_admins",
    content => "$name\n",
    notify  => Notify['p_update'],
  }
}

