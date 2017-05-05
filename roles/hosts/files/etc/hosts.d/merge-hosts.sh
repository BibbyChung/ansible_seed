#!/usr/bin/env sh
if [ ! -f "/etc/hosts.d/local.hosts" ]; then
    cat /etc/hosts > /etc/hosts.d/local.hosts
fi

# cat /etc/hosts.d/*.hosts > /etc/hosts
echo '# !!!NOTICE: DO NOT MODIFY THIS FILE DIRECTLY.' > /etc/hosts
echo '# If you want to add local hosts, add them to /etc/hosts.d/local.hosts.' >> /etc/hosts
echo '# Then run `sudo sh /etc/hosts.d/merge-hosts.sh`' >> /etc/hosts

for file in /etc/hosts.d/*.hosts
do
    if test -f $file
    then
        echo "\n" >> /etc/hosts
        echo "### Start: merge from $file" >> /etc/hosts
        cat $file >> /etc/hosts
        echo "### End: merge from $file" >> /etc/hosts
        echo "\n" >> /etc/hosts
    fi
done
echo 'Merged successful.'