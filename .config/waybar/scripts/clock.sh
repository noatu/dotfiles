#!/usr/bin/bash
TEXT=$(date +'%-d %a %R')
ALT=$(date +'%a/%b %-d.%m.%Y %R')
echo '{"text": "'$TEXT'", "alt": "'$ALT'"}'
