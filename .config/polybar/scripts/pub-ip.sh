#!/usr/bin/env bash
#
# pub-ip.sh — show public or private IP in Polybar, toggle on click.
#
#   pub-ip.sh           print the IP for the current mode
#   pub-ip.sh toggle    flip between public <-> private (call from click-left)
#
# Public IP is cached so frequent refreshes don't hammer the IP services.

STATE_FILE="/tmp/polybar-ip-mode"
CACHE_FILE="/tmp/polybar-ip-public"
CACHE_TTL=300   # seconds to keep a cached public IP before refetching

mode=$(cat "$STATE_FILE" 2>/dev/null || echo "public")

# --- click handler: flip the mode and exit (display updates on next interval)
if [ "$1" = "toggle" ]; then
    if [ "$mode" = "public" ]; then
        echo "private" > "$STATE_FILE"
    else
        echo "public" > "$STATE_FILE"
    fi
    exit 0
fi

# --- private / LAN IP (local lookup, instant)
if [ "$mode" = "private" ]; then
    ip=$(ip route get 1.1.1.1 2>/dev/null \
         | awk '{for(i=1;i<=NF;i++) if($i=="src"){print $(i+1); exit}}')
    [ -z "$ip" ] && ip=$(hostname -I 2>/dev/null | awk '{print $1}')
    echo "${ip:-no-lan}"
    exit 0
fi

# --- public IP (cached, with timeout + fallbacks)
now=$(date +%s)
cached_time=0
[ -f "$CACHE_FILE" ] && cached_time=$(stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)
age=$(( now - cached_time ))

if [ "$age" -lt "$CACHE_TTL" ] && [ -s "$CACHE_FILE" ]; then
    cat "$CACHE_FILE"
    exit 0
fi

pubip=""
for url in https://ifconfig.me/ip https://icanhazip.com https://api.ipify.org; do
    pubip=$(curl -s --max-time 3 "$url" | tr -d '[:space:]')
    [ -n "$pubip" ] && break
done

if [ -n "$pubip" ]; then
    echo "$pubip" > "$CACHE_FILE"
    echo "$pubip"
elif [ -s "$CACHE_FILE" ]; then
    cat "$CACHE_FILE"
else
    echo "offline"
fi
