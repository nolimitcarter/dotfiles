#!/usr/bin/env bash
#
# pub-ip.sh — print the machine's public IP for Polybar.
# Tries several providers with a short timeout so the bar never hangs.

TIMEOUT=3   # seconds per provider

providers=(
    "https://ifconfig.me/ip"
    "https://icanhazip.com"
    "https://api.ipify.org"
    "https://ipinfo.io/ip"
)

for url in "${providers[@]}"; do
    ip=$(curl -s --max-time "$TIMEOUT" "$url" | tr -d '[:space:]')
    if [ -n "$ip" ]; then
        echo "$ip"
        exit 0
    fi
done

# nothing worked (likely offline)
echo "offline"
