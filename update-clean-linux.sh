#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive

/usr/bin/apt-get -qq update
/usr/bin/apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  dist-upgrade

/usr/bin/apt-get -y autoremove --purge
/usr/bin/apt-get -y clean

/usr/bin/journalctl --vacuum-time=7d --quiet

/usr/bin/find /var/log -type f -name "*.log" -mtime +7 -delete
/usr/bin/find /var/log -type f -name "*.gz" -mtime +7 -delete
/usr/bin/find /var/cache -type f -mtime +7 -delete
/usr/bin/find /var/tmp -type f -mtime +7 -delete
/usr/bin/find /tmp -type f -mtime +7 -delete

/sbin/reboot
