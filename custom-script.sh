#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb


if [ $(lsb_release -sc) = "stretch" ]; then
	# Add stretch-backports repo
	echo "==> Add stretch-backports repo"
	echo "" >> /etc/apt/sources.list
	echo "# stretch-backports" >> /etc/apt/sources.list
	echo "deb http://http.debian.net/debian stretch-backports main" >> /etc/apt/sources.list

	# Install ansible
	echo "==> Install ansible"
	apt-get update
	apt-get -y install ansible -t stretch-backports
else
	echo "==> Install ansible"
	apt-get update
	apt-get -y install ansible
fi