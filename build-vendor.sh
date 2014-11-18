#!/bin/bash

vagrant up
vagrant ssh -c "cd /vagrant && ./bin/build_apache"
vagrant destroy -f