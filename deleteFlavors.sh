#!/bin/bash

flavorCount=15

for i in `seq 1 $flavorCount`;
    do
        openstack flavor delete m1.$i   
    done 
