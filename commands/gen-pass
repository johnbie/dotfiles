#!/usr/bin/env bash

# Usage Guide
# 
# Pass the length of the password you want (i.e. `./gen-pass 12`)

password_length=$1
head /dev/urandom | tr -cd '[:alnum:]!@#$%^&*.?;:~' | cut -c 1-$password_length
