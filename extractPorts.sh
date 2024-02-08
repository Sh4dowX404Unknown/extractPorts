#!/bin/bash
                                                          
# Colors Code
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
END_COLOR="\e[0m"

if [ "$#" -eq 0 ]; then
	echo -e "\n${RED}[!] Error! No argument supplied!${END_COLOR}"
	echo -e "\n${YELLOW}[-] Usage: bash extractPorts file${END_COLOR}"
	exit 1
fi

# Banner
cat << "EOF"
+--------------------------------------------------+
|          _               _   ___         _       |
|  _____ _| |_ _ _ __ _ __| |_| _ \___ _ _| |_ ___ |
| / -_) \ /  _| '_/ _` / _|  _|  _/ _ \ '_|  _(_-< |
| \___/_\_\\__|_| \__,_\__|\__|_| \___/_|  \__/__/ | v.1.0		 by Sh4dowX
|                                                  |
+--------------------------------------------------+
EOF

# Extracting information
ports="$(cat $1 | grep -oP '\d{1,5}/' | awk '{print$1}' FS='/' | xargs | tr ' ' ',')"
ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)"

# Show the extracted information
echo -e "\n${YELLOW}[*] Extracting information...${end_color}"
echo -e "\n${BLUE}[+] IP Address:${END_COLOR} $ip_address"
echo -e "\n${BLUE}[+] Ports:${END_COLOR} $ports"

# Copying to clipboard
echo -e "\n\n${YELLOW}[*] Copying ports to clipboard...${END_COLOR}"
echo $ports | xclip -r -selection c
echo -e "\n${GREEN}[+] Ports copied to clipboard!${END_COLOR}"
