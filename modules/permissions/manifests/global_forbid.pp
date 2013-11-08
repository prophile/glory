define permissions::global_forbid ()
{
  concat::fragment { "p_global_forbid_$name":
    target  => "p_global_forbid",
    content => "$name\n",
    notify  => Anchor['p_update'],
  }
}

