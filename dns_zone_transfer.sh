#!/bin/bash

# dns zone transfer
# Author: S4m1X
# Description:
# Enumerates the authoritative name servers (NS records) of a target domain
# and attempts a DNS zone transfer (AXFR) against each server.
# If zone transfers are allowed, the script extracts and displays discovered
# subdomains and their associated IP addresses.
# ============================================================================


# Check if a domain was provided
if [ -z "$1" ]; then
    echo "[*] Usage: $0 <domain>"
    echo "[*] Example: $0 example.com"
    exit 1
fi

# Store the target domain
domain="$1"

echo "[*] Looking up authoritative name servers for $domain..."
echo

# Retrieve all authoritative name servers and attempt a zone transfer on each
for ns in $(host -t ns "$domain" | cut -d " " -f 4); do

    echo "[*] Testing zone transfer against: $ns"

    # Attempt a DNS zone transfer (AXFR)
    # If successful, display records containing IP addresses
    host -l "$domain" "$ns" 2>/dev/null | grep "has address"

    echo
done