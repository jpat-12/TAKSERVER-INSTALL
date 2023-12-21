#!/bin/bash

# Get TAKServer address from user input
echo "What is your TAKServer access address?"
read address

# Get TCP/SSL usage from user input
echo "Do you want to use TCP or SSL for TAKServer connection? (tcp/ssl) (NO CAPITALS IN YOUR ANSWER)"
read protocol

# Get port number from user input
echo "Enter the port number for TAKServer connection"
read port

ls -la /opt/tak/certs/files
echo "Enter your Certificate Authority name" 
read ca

echo "What is the path of your httpd server (if using default, then input \"/var/www/html\")"
read httpd

clear

# Append the variables to the variables file
echo -e "address=\"$address\"\nprotocol=\"$protocol\"\nport=\"$port\"\nca=\"$ca\"\nhttpd=\"$httpd\"" >> /opt/tak/certs/files/packages/var.sh

# Make the variables file executable
chmod +x /opt/tak/certs/files/packages/var.sh

echo "TAKServer address set to: $address"
echo "Protocol set to: $protocol"
echo "Port number set to: $port"
echo "CA Name set to: $ca"
echo "httpd_path: $httpd" 
echo "Variables added to /opt/tak/certs/files/packages/var.sh"

