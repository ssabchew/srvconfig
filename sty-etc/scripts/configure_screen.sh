#!/bin/bash
set -e

if ! command -v screen &>/dev/null ;then
    yum -y install screen &>/dev/null
else
    [ -f /etc/screenrc.dist ] && echo -e "already configured...exiting\nyou can manually copy file \
    $(find /etc -type f -iname screenrc.cfg) to /etc/screenrc"
exit 1
fi

# configure SCREEN
mycfg=$(find /etc -type f -iname screenrc.cfg)
/usr/bin/cp /etc/screenrc /etc/screenrc.dist
/usr/bin/cp ${mycfg} /etc/screenrc
