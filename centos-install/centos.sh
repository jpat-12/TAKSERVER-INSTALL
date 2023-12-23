#!/bin/bash
echo "THIS SCRIPT WILL USE THE INSTRUCTIONS PROVIDED BY ATAK HQ" 
echo ""
echo "IT WILL AUTOMATICALLY DO EVERYTHING FOR YOU" 

echo ""
echo ""
sleep 2
echo "STARTING SCRIPT" 
sleep 2
clear 

echo "Setting Up Firewalld" 
echo ""
sudo yum install firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-forward-port=port=443:proto=tcp:toport=8446
sudo firewall-cmd --runtime-to-permanent
echo "Firewalld Setup Complete" 
sleep 2
clear 

cd /tmp
echo "Moved to tmp directory; cloning required repos" 
sleep 2
echo ""
echo ""
echo ""
git clone https://github.com/jpat-12/centos-scripts.git && cd centos-scripts
clear

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

echo "Downloading TAKServer" 
cd /home/atak/Downloads
sudo yum install wget
sudo wget "https://docs.google.com/uc?export=download&confirm=t&id=1KQfiCPrN4z-v52xu48KYxUxGFRGApEpX" -O takserver-4.8-RELEASE31.noarch.rpm
sudo wget "https://docs.google.com/uc?export=download&confirm=t&id=1n8oTPtRv4f5JS6UkeIDakQt-Z2TQdKGl" -O takserver-4.8-RELEASE45.noarch.rpm
clear


echo "Please Make Sure The Files Are In The /atak/home/Downloads Directory" 
ls -la /home/atak/Downloads
echo "please hit enter to continue" 
read enter

echo "Changing Perms For Install File" 
sudo chmod +x Centos7_tak4.9_install.sh
wait 2
echo "running install file" 
./Centos7_tak4.9_install.sh

clear
service takserver restart
java -jar /opt/tak/utils/UserManager.jar usermod -A -p G0$%1vilAirPatrol624918 jpattara-ilwg.cap.gov
sleep 2

clear
echo "Setting up for extracted war" 
cd /opt/tak
./setup-for-extracted-war.sh

echo "Downloading New CAP Icons" 
cd /tmp
wget "https://docs.google.com/uc?export=download&confirm=t&id=15HKhdxdi5QkB5gRrwP0_qbmjimXhPsEF" -O 'Incident Icons.zip'
echo "Downloading New Manifest File" 
wget "https://docs.google.com/uc?export=download&confirm=t&id=1nUjwuI8XHRFsEiCqCUoLled9a4pyEf5M" -O webtak-manifest.json

echo "Setting Up Incident Icons" 
mv /tmp/'Incident Icons.zip' /opt/tak/extract/webtak/iconset/'Incident Icons.zip'
cd /opt/tak/extract/webtak/iconset/
unzip 'Incident Icons.zip'
rm 'Incident Icons.zip'
sleep 3
clear 

echo "Setting Up New WebTAK Manifest File" 
cp /tmp/webtak-manifest.json /opt/tak/extract/webtak/webtak-manifest.json
sleep 3
clear
echo "___________________________________________"
echo "To enable lets encrypt please allow port 80" 
echo "__when post 80 is added and you have an A__"
echo "record in your DNS to point to this machine" 
echo "cd /home/atak/Downloads && ./takserver_createLECerts.sh "
java -jar /opt/tak/utils/UserManager.jar usermod -A -p G0$%1vilAirPatrol624918 jpattara-ilwg.cap.gov
echo ""
echo ""
echo "User: jpattara-ilwg.cap.gov" 
echo "Pass: G0$%1vilAirPatrol624918"
echo "You may have to hit webtak once then re-run the following command" 
echo "java -jar /opt/tak/utils/UserManager.jar usermod -A -p G0$%1vilAirPatrol624918 jpattara-ilwg.cap.gov"
echo ""
echo ""
echo "___________TAKSERVER INSTALL DONE__________" 
echo "___________________________________________"



