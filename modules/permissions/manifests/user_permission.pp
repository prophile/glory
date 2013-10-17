define permissions::user_permission ()
{
  concat::fragment { "p_user_permission_$name":
    target  => "p_user_permissions",
    content => "$name\n",
    notify  => Service['minecraft'],
  }

  permissions::mod_permission { $name: }
}

