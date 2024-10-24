#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Add Custom Repos
curl -o /etc/yum.repos.d/system76.repo https://copr.fedorainfracloud.org/coprs/szydell/system76/repo/fedora-40/szydell-system76-fedora-40.repo

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen
rpm-ostree install system76-driver system76-power
systemctl enable com.system76.PowerDaemon.service system76-power-wake
systemctl enable podman.socket
