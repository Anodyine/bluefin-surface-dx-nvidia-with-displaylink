#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install texlive-collection-publishers
rpm-ostree install texlive-amscls
rpm-ostree install latexmk
texhash
rpm-ostree install gh
rpm-ostree install /tmp/sunshine.rpm
# echo 'KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"' | \
# tee /etc/udev/rules.d/60-sunshine.rules
# modprobe uinput
# setcap cap_sys_admin+p $(readlink -f $(which sunshine))
# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
