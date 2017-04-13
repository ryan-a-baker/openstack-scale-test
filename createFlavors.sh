#!/bin/bash

flavorCount=15

for i in `seq 1 $flavorCount`;
    do
        openstack flavor create --disk 40 --ram 4096 --vcpus 1 --public m1.$i   
    done 
