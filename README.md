# DNS Zone Transfer Enumerator

A simple Bash script that enumerates a target domain's authoritative DNS servers and attempts a DNS zone transfer (AXFR) against each server.

If a DNS server is misconfigured and allows zone transfers, the script will extract and display discovered subdomains and their associated IP addresses.

## Features

- Retrieves authoritative DNS servers (NS records)
- Attempts DNS zone transfers (AXFR)
- Extracts discovered hosts with IPv4 addresses
- Lightweight and easy to use
- No external dependencies beyond standard Linux DNS tools

## Requirements

The script requires:

- Bash
- host (usually provided by the DNS utilities package)

## Usage

```bash
chmod +x dns_zone_transfer.sh
./dns_zone_transfer.sh <domain>
```

### Example

```bash
./dns_zone_transfer.sh example.com
```

## Sample Output

```text
[*] Looking up authoritative name servers for example.com...

[*] Testing zone transfer against: ns1.example.com.

www.example.com has address 192.168.1.10
mail.example.com has address 192.168.1.20
vpn.example.com has address 192.168.1.30

[*] Testing zone transfer against: ns2.example.com.
```

## How It Works

1. Queries the target domain's authoritative name servers (NS records).
2. Iterates through each DNS server.
3. Attempts a DNS zone transfer (AXFR).
4. Displays discovered records containing IPv4 addresses.

## Disclaimer

This tool is intended for:

- Educational purposes
- Security assessments
- Authorized penetration testing
- DNS administration and auditing

Only use this tool against systems you own or have explicit permission to test.

## License

This project is licensed under the MIT License.
