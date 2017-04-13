#!/bin/bash

# The number of instances to launch
instanceCount=15
# The image/snapshot to use to launch an instance
instanceImage=snapshot-test
# The name of the keypair to inject in to the instance
key=test-key
# The GUID for the security group to place the instance in
securityGroup=
# The network to place the instance on 
networkID=
# the availability zone to launch the instances in
az=

for i in `seq 1 $instanceCount`;
do
    openstack server create --flavor m1.$i --image $instanceImage --key-name $key --security-group $securityGroup --nic net-id=$networkID  --availability-zone $az scale-test-$i
done
