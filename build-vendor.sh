#!/bin/bash

vagrant up
vagrant ssh -c "cd /vagrant && sudo ./bin/build_apache"
vagrant destroy -f