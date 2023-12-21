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

git clone https://github.com/jpat-12/centos-scripts.git && cd centos-scripts


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
cp /tmp/centos-scripts/Centos7_tak4.9_install.sh /home/atak/Downloads
cp /tmp/centos-scripts/createTakCerts.sh /home/atak/Downloads
cp /tmp/centos-scripts/takserver_createLECerts.sh /home/atak/Downloads
cp /tmp/centos-scripts/takserver_renewLECerts.sh /home/atak/Downloads
cp /tmp/centos-scripts/takUserCreateCerts_doNotRunAsRoot.sh /home/atak/Downloads

echo "downloading takserver" 
cd /home/atak/Downloads
sudo yum install wget
sudo wget "https://docs.google.com/uc?export=download&confirm=t&id=1KQfiCPrN4z-v52xu48KYxUxGFRGApEpX" -O takserver-4.8-RELEASE31.noarch.rpm
sudo wget "https://docs.google.com/uc?export=download&confirm=t&id=1n8oTPtRv4f5JS6UkeIDakQt-Z2TQdKGl" -O takserver-4.8-RELEASE45.noarch.rpm
clear


echo "please make sure the files are in the /atak/home/Downloads directory" 
ls -la /home/atak/Downloads
echo "please hit enter to continue" 
read enter

echo "changing perms for install file" 
sudo chmod +x Centos7_tak4.9_install.sh
wait 2
echo "running install file" 
./Centos7_tak4.9_install.sh

clear
java -jar /opt/tak/utils/UserManager.jar usermod -A -p G0$%1vilAirPatrol624918 jpattara-ilwg.cap.gov
sleep 2

clear
echo "Setting up for extracted war" 
cd /opt/tak
./setup-for-extracted-war.sh

echo "To enable lets encrypt please allow port 80" 
echo "when post 80 is added and you have an A record in your DNS to point to this machine" 
echo "run cd /home/atak/Downloads && ./takserver_createLECerts.sh "
java -jar /opt/tak/utils/UserManager.jar usermod -A -p G0$%1vilAirPatrol624918 jpattara-ilwg.cap.gov

echo "User jpattara-ilwg.cap.gov created with a password G0$%1vilAirPatrol624918"

echo "TAKSERVER INSTALL DONE" 


