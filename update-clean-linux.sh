#!/bin/bash
set -e

export APT_LISTCHANGES_FRONTEND=none
export DEBIAN_FRONTEND=noninteractive

/usr/bin/apt-get -qq update
/usr/bin/apt-get -y \
  -o Dpkg::Options::="--force-confdef" \
  -o Dpkg::Options::="--force-confold" \
  dist-upgrade

/usr/bin/apt-get -y autoremove --purge
/usr/bin/apt-get -y clean

/usr/bin/journalctl --vacuum-time=7d --quiet

if [ -f /var/run/reboot-required ]; then
    cd /root/vpnbot && make d 2>/dev/null || true
    /sbin/reboot
fi
