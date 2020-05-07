#!/usr/bin/env python 
import socket 
from colorama import init, Fore

# Colors
# Usage: python scanner.py --host HOSTNAME --port 1-65000

init() 
GREEN = Fore.GREEN
RESET = Fore.REST
GRAY = Fore.LIGHTBLACK_EX

def is_port_open(host, port): 
    s = socket.socket()

    try: 
        s.connect((host,port))

    except: 
        return False

    else: 
        return True

    host = input("Enter the host:") 

    for port in range(1, 1025): 
        if is_port_open(host, port): 
            print(f"{GREEN}[+] (host):(port) is open    {RESET}")
        else: 
            print(f"{GRAY}[!] (host):(port) is closed   {RESET}", end="\r")

