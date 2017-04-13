# openstack-scale-test
Basic one-off written for testing the scale point of OpenStack backed by vCenter

The purpose is to evaluate if instance lauching of multiple images with a variety of different flavors will cause an issue with scaling due to the cloning process on the vCenter backend.

# Usage

First - launch an instance using the cloud init script.  This will write 15GB worth of random data to the instance and then shut it down.  Once shut down is complete, take a snap of the instance.  If you wish to have multiple images, take a second snap after the first one completes. 

After sourcing your OpenStack credentials, run the "createFlavor" script to create the additional flavors.  My test used 15.

After the flavors have been created, update the scaleTest.sh with all the correct parameters for your environment and then run it.  For my tests, I used 15 again.

Once the script has completed, you can run the script again using either a second image or a second AZ.

# Notes

While test, I found that VMware backed OpenStack doesn't exactly adhere to the snapshot functionality of Glance. Once a snapshot is complete, the snapshot should be uploaded to glance, and in turn, the glance backend.  However, I found that the snapshot remains on the datastore that the instance is running on.

The result of this is a user could have faster launching performance in one AZ than other AZ's.  If the snapshot is performed in AZ1, subsequent launches of images in AZ1 will be faster.  It's when you select a different AZ that clones will have to be copied across datastore, introducing scale issues.


