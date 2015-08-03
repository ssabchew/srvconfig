alias l='ls -Fax'
# The next two can (most of the time) complain that there's no '..?' file
#alias l.='ls -d .{.?,[^.]}* --color=tty'
# NB: .? means a dot and any character after that, one!
alias l.='ls -d .[^.]* ..?* --color=tty 2>/dev/null'
#alias l.='ls -d .[!.]* ..?* --color=tty 2>/dev/null'
#echo .[!.]* ..?* *

alias ll='ls -Alg'

# alias ls='ls -F -X -B -T 0 --color=tty'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias lll='ls -Al "--time-style=+%Y-%m-%d %H:%M:%S %4Z"'

# Subversion
alias svnign='svn propedit svn:ignore "$@"'

# color grep
alias grep='grep --colour=auto'
# color less (restricted)
alias less='less -R'
