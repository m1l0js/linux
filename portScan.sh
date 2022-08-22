#!/bin/bash

function get_out(){
    echo -e "\n[!] You have pressed ctrl+c. Exiting ...\n"
    tput cnorm; exit 1
}

# Ctrl+c 
trap ctrl_c INT

#User interaction
echo -e "\n***Hello, could you insert the IP?: "
read ip

echo -e "\nAll the ports opened will be displayed below. Be patient\n"

tput civis #Do not show the cursor
for port in $(seq 1 65365); do 
    timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "[*]Port $port: opened" &
done; wait
echo -e "\nScan finished. Good hacking\n"
tput cnorm #Recover the cursor
