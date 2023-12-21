#!/bin/bash

echo "installing Zip" 
yum install zip 

echo "this will set up the proper directories" 

mkdir /opt/tak/certs/files/packages
cd /opt/tak/certs/files/packages
mkdir /opt/tak/certs/files/packages/finished


echo "Moving create.sh script" 
cp /tmp/TAKSERVER-INSTALL/Package-Creation/create.sh /opt/tak/certs/files/packages
cd /opt/tak/certs/files
sudo chmod +x create.sh 
echo "created create script in packages directory"

echo "run variable script" 
cp /tmp/TAKSERVER-INSTALL/Package-Creation/var.sh /opt/tak/certs/files/packages/var.sh
cd /tmp/TAKSERVER-INSTALL/Package-Creation
sudo chmod +x /tmp/TAKSERVER-INSTALL/Package-Creation/variable.sh
./variable.sh
echo "variable script run" 