echo "this will set up the proper directories" 



mkdir /opt/tak/certs/files/packages
cd /opt/tak/certs/files/packages

cp /tmp/TAKSERVER-INSTALL/Package-Creation/data-package-creation.sh /opt/tak/certs/files/packages/create.sh
chmod +x /opt/tak/certs/files/packages/create.sh
echo "created create script in packages directory"

echo "run variable script" 
cd /tmp/TAKSERVER-INSTALL/Package-Creation
sudo chmod +x /tmp/TAKSERVER-INSTALL/Package-Creation/variable.sh
./variable.sh

echo "variable script run" 
