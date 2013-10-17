define permissions::mod ()
{
  concat::fragment { "p_mod_$name":
    target  => "p_mods",
    content => "$name\n",
    notify  => Service['minecraft'],
  }
}

