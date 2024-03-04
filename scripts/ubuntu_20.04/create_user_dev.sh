#!/usr/bin/env bash
sudo useradd -m -d /home/dev -s /bin/bash dev
echo 'dev:password123' | chpasswd
sudo usermod -a -G sudo dev
mkdir -p /home/dev/.ssh
touch /home/dev/.ssh/authorized_keys
chown -R dev:dev /home/dev/.ssh
chmod 700 /home/dev/.ssh
chmod 600 /home/dev/.ssh/authorized_keys
