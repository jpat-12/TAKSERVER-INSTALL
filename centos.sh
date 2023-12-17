#!/bin/bash
echo "THIS SCRIPT WILL USE THE INSTRUCTIONS PROVIDED BY ATAK HQ" 
echo ""
echo "IT WILL AUTOMATICALLY DO EVERYTHING FOR YOU" 

echo ""
echo ""
sleep 2
echo "STARTING SCRIPT" 
sleep 2

cd /tmp
echo "Moved to tmp directory; cloning required repos" 

PUT CLONES REPOS HERE

echo "Creating ATAK user" 
sudo useradd -m atak

clear 
echo "type "atakatak" when prompted" 
echo "you will get this message, “BAD PASSWORD:
The password contains the user name in some form” its ok just retype
atakatak again.
You will know you did it right when you get this message in return all
authentication tokens updated successfully."
sleep 2
sudo passwd atak

clear 
echo "changing atak to be an admin" 
sudo usermod -aG wheel atak

echo "Creating ATAK Directory" 
sudo mkdir /home/atak/Downloads


echo "Copying files to new directory" 
cd /home/atak/Downloads 
cp /tmp/centos-scripts/Centos7_tak4.9_install.sh /atak/home/Downloads
cp /tmp/centos-scripts/createTakCerts.sh /atak/home/Downloads
cp /tmp/centos-scripts/takserver_createLECerts.sh /atak/home/Downloads
cp /tmp/centos-scripts/takserver_renewLECerts.sh /atak/home/Downloads
cp /tmp/centos-scripts/takUserCreateCerts_doNotRunAsRoot.sh /atak/home/Downloads

echo "downloading takserver" 
cd /home/atak/Downloads
sudo wget "https://docs.google.com/uc?export=download&confirm=t&id=1KQfiCPrN4z-v52xu48KYxUxGFRGApEpX" -O takserver-4.8-RELEASE31.noarch.rpm
sudo wget "https://docs.google.com/uc?export=download&confirm=t&id=1n8oTPtRv4f5JS6UkeIDakQt-Z2TQdKGl" -O takserver-4.8-RELEASE45.noarch.rpm



echo "please make sure the files are in the /atak/home/Downloads directory" 
ls -la /atak/home/Downloads
echo "please hit enter to continue" 
read enter

echo "changing perms for install file" 
sudo chmod +x Centos7_tak4.9_install.sh
wait 2
echo "running install file" 
./Centos7_tak4.9_install.sh

echo "To enable lets encrypt please allow port 80" 
echo "when post 80 is added and you have an A record in your DNS to point to this machine" 
echo "run ./takserver_createLECerts.sh" 

echo "TAKSERVER INSTALL DONE" 


