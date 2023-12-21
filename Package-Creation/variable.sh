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

echo "what is the path of your httpd server (if using default than input "/var/www/html")"
read httpd

clear
# Create or overwrite the variables file

#With echo statements
#sed -i 's|./variables.sh|echo "Address = $address" \naddress="$address"\n\n# Protocol variable\necho "Protocol = $protocol" \nprotocol="$protocol"\n\n# Port number variable\necho "Port Number = $port" \nport="$port"\n\n# Certificate Authority variable \necho "CA Name" \nca=$ca\n\n# Httpd variable \necho "httpd file path" \nhttpd=$httpd|' /opt/tak/certs/files/packages/create.sh

#without echo statements
sed -i 's|#Place-Variables-Here|address="$address"\nprotocol="$protocol"\nport="$port"\nca=$ca\nhttpd=$httpd|' /opt/tak/certs/files/packages/create.sh


# Make the variables file executable
echo "TAKServer address set to: $address"
echo "Protocol set to: $protocol"
echo "Port number set to: $port"
echo "CA Name set to: $ca"
echo "httpd_path: $httpd" 
echo "variables added to /opt/tak/certs/files/packages/create.sh"
