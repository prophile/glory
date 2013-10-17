define permissions::user_permission ()
{
  concat::fragment { "p_user_permission_$name":
    target  => "p_user_permissions",
    content => "$name\n",
    notify  => Notify['p_update'],
  }

  permissions::mod_permission { $name: }
}

