# Collection of cron scsripts, coinfguration files and scripts to customize bash, alias and colors.
Also adds a prompt logging functionality.

## Installation

First, install prerequisite packages:


```sh
yum -y install rpmdevtools
sudo bash builddep_fedora.sh
rpmdev-setuptree
bash build_rpm.sh
# Read where the output rpm file is written and use yum to install the package for your arch.
# example install:
sudo yum install ~/rpmbuild/RPMS/x86_64/mmserver-1.4.0-0.SS.fc19.x86_64.rpm 
```
