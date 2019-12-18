#!/bin/sh
system="`lsb_release -sc`"


sudo su <<EOF


apt install curl ca-certificates gnupg -y
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
touch /etc/apt/sources.list.d/pgdg.list
echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $system-pgdg main" > /etc/apt/sources.list.d/pgdg.list
EOF
