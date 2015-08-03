augeas { "sshd_config":
  context => "/files/etc/ssh/sshd_config",
  changes => [
    "set PasswordAuthentication yes",
    "set GSSAPIAuthentication no",
    "set UseDNS no",
  ],
}

augeas {"ssh_config":
  context => "/files/etc/ssh/ssh_config",
  changes => [
    "set Host[.='*']/GSSAPIAuthentication no",
  ],
}
