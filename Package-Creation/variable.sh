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

# Create or overwrite the variables file
cat << EOF > "/opt/tak/certs/files/packages/$variables.sh"
#!/bin/bash

# TAKServer address variable
TAKSERVER_ADDRESS="$address"

# Protocol variable
PROTOCOL="$protocol"

# Port number variable
PORT_NUMBER="$port"
EOF

# Make the variables file executable
chmod +x /opt/tak/certs/files/packages/$variables.sh

echo "TAKServer address set to: $address"
echo "Protocol set to: $protocol"
echo "Port number set to: $port"
echo "Variables file created at: /opt/tak/certs/files/packages$variables.sh"
