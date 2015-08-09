#!/bin/bash
set -e

if ! command -v augtool &>/dev/null ;then
    apt-get -y install augeas &>/dev/null || zypper -n install augeas &>/dev/null || yum -y install augeas &>/dev/null
fi

augtool <<EOF

set /files/etc/ssh/sshd_config/PasswordAuthentication no
set /files/etc/ssh/sshd_config/GSSAPIAuthentication no
set /files/etc/ssh/sshd_config/UseDNS no
set /files/etc/ssh/sshd_config/ChallengeResponseAuthentication no
set /files/etc/ssh/ssh_config/Host[.='*']/GSSAPIAuthentication no
save

EOF

# restert ssh daemon
[ "$?" -eq 0 ] && service sshd restart
