define permissions::mod_permission ()
{
  concat::fragment { "p_mod_permission_$name":
    target  => "p_mod_permissions",
    content => "$name\n",
    notify  => Notify['p_update'],
  }
}

