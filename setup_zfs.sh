#! /бин/баш


# https://www.centos.org/centos-linux-eol/
# так что это обходной путь для использования хранилища
sed -i ' s/mirrorlist/#mirrorlist/g ' /etc/yum.repos.d/CentOS- *
sed -i ' s|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g ' /etc/yum.repos.d/CentOS- *

yum установить -y yum-utils

установка dnf -y https://zfsonlinux.org/epel/zfs-release.el8_5.noarch.rpm
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux

yum-config-manager --включить zfs-kmod
yum-config-manager --отключить zfs
ням установить -y zfs
модзонд zfs


# включить завершение bash

cd /usr/share/bash-completion/completions/
curl -O https://raw.githubusercontent.com/openzfs/zfs/zfs-0.8-release/contrib/bash_completion.d/zfs
chmod +x zfs
