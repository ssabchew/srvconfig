#!/bin/bash
set -e

if ! command -v puppet &>/dev/null ;then
    yum -y install puppet &>/dev/null
fi

# configure SSH client
#sed -i  's|GSSAPIAuthentication.*|GSSAPIAuthentication no|' /etc/ssh/ssh_config

# configure SSH server
mypp=$(find /etc -type f -iname sshd_config.pp)
puppet apply ${mypp}

# restert ssh daemon
service sshd restart
