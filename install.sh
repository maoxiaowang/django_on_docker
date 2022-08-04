#!/bin/sh
# Prepare ansible environment
###################################
### Currently only for CentOS 7 ###
###################################

# Python dependencies
yum install -y openssl openssl-devel libffi-devel gcc zlib-devel xz-devel bzip2-devel bzip2-libs readlines*

# install Python3.9
if python3 --version; then
    echo 'Python 3 was installed already'
else
    cd packages && tar -xf Python-3.9.10.tar.xz && cd Python-3.9.10 && ./configure  && make -j 4 && make install
fi


# install ansible
yum install -y epel-release
yum install -y ansible

# configure ansible
sed -i "s/#host_key_checking = False/host_key_checking = False/g" /etc/ansible/ansible.cfg

# run ansible playbook
ansible-playbook -i ansible/hosts ansible/setup.yml
