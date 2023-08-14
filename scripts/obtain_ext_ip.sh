#!/bin/bash

# using [ host myip.opendns.com resolver1.opendns.com ] would also return current IPv6 address, only supporting IPv4 for now 

ip=$(dig +short txt ch whoami.cloudflare @1.0.0.1 | sed 's/"//g'|sed 's/$/\/32/g')

echo {\"ip\"\:\"${ip}\"}

