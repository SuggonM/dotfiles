#!/usr/bin/env sh

cd ~/.ssh
ssh ubuntu -t "ssh-keygen -e -f ~/.ssh/id_ecdsa -m pem" > id_ecdsa.pub.host.pem
cat id_ecdsa id_ecdsa.pub.host.pem > id_ecdsa.pem
cat id_ecdsa.pub | ssh ubuntu -t "cat >> ~/.ssh/authorized_keys"
