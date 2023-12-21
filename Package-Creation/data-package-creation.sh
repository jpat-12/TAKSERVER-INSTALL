#!/bin/bash

echo "This script will automatically create a data package and push it to a webserver for you" 
echo ""
echo ""
echo "press enter to continue" 
read enter

echo "make a few lines that call on another script to make the variable and then use that variable and comment out this question after the first time it is being run" 

cd /opt/tak/certs 

echo "What is the CAPID of the User" 
read capid
echo ""
echo ""
echo "What is the name of the user" 
read name
clear
./variable.sh


cd /opt/tak/certs
./makeCert.sh client $capid

mkdir /opt/tak/certs/files/packages/$capid

cp /opt/tak/certs/files/$capid.p12 /opt/tak/certs/files/packages/$capid

clear
echo "Creating User Package" 
sleep 2


echo "Creating Zipable Directory and Manifest File for CAPID: $capid"

# Set the path to the directory and manifest file
directory="/opt/tak/certs/files/packages/"
manifest_file="manifest.xml"

# Initialize counter or read it from a file if it exists
counter_file="/opt/tak/certs/files/packages/counter.txt"
if [ -f "$counter_file" ]; then
  counter=$(<"$counter_file")
else
  counter=1
fi

# Increment the counter
((counter++))

# Save the new counter value
echo "$counter" > "$counter_file"

# Set the UID using the counter
uid="57aa4e78-0c63-4465-bf33-0aef8efe8bcd$counter"

# Create directories
mkdir -p "$directory$capid"
mkdir -p "$directory$capid/MANIFEST"

# Create Manifest File
cat << EOF > "$directory$capid/MANIFEST/$manifest_file"
<MissionPackageManifest version="2">
<Configuration>
<Parameter name="uid" value="$uid"/>
<Parameter name="name" value="CAP-ILWG-TAKServer"/>
<Parameter name="onReceiveDelete" value="true"/>
</Configuration>
<Contents>
<Content zipEntry="$capid.p12" ignore="false"/>
<Content zipEntry="Certificate-Authority.p12" ignore="false"/>
<Content zipEntry="package_builder.pref" ignore="false"/>
</Contents>
</MissionPackageManifest>
EOF

echo "Running Varriables Script" 
cd /opt/tak/certs/files/packages/
./variables.sh
echo ""

echo "Creating Package_Builder.pref"

cat << EOF > "$directory$capid/package_builder.pref"
<?xml version='1.0' standalone='yes'?>
<preferences>
<preference version="1" name="cot_streams">
<entry key="count" class="class java.lang.Integer">1</entry>

<entry key="description0" class="class java.lang.String">CAP-ILWG-TAKServer</entry>
<entry key="enabled0" class="class java.lang.Boolean">true</entry>
<entry key="connectString0" class="class java.lang.String">$address:$port:$protocol</entry>
<entry key="caPassword0" class="class java.lang.String">atakatak</entry>
<entry key="certificateLocation0" class="class java.lang.String">cert/$capid.p12</entry>
<entry key="caLocation0" class="class java.lang.String">cert/Certificate-Authority.p12</entry>
<entry key="clientPassword0" class="class java.lang.String">atakatak</entry>

</preference>
<preference version="1" name="com.atakmap.app_preferences">
<entry key="deviceProfileEnableOnConnect" class="class java.lang.Boolean">true</entry>
<entry key="enableNonStreamingConnections" class="class java.lang.Boolean">false</entry>
<entry key="MobileLayerSelectionAdapter.selected" class="class java.lang.String">0.GoogleHybrid</entry>
<entry key="hostileUpdateDelay" class="class java.lang.String">0</entry>
<entry key="coord_display_pref" class="class java.lang.String">DD</entry>
<entry key="rab_rng_units_pref" class="class java.lang.String">0</entry>
<entry key="enhanced_depth_perception_rendering" class="class java.lang.Boolean">false</entry>
</preference>
</preferences>
EOF



echo "Copying Certificate Authority" 
cp /opt/tak/certs/files/$ca /opt/tak/certs/files/packages/Certificate-Authority.p12
cp /opt/tak/certs/files/$capid.p12 /opt/tak/certs/files/packages/$capid.p12


cd /opt/tak/certs/files/packages 

mkdir finished

cd /opt/tak/certs/files/packages 
zip -r $capid.zip $capid
rm -rf $capid.p12
cp "$capid.zip" finished
cp $capid.zip $httpd_path

