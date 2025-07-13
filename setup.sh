#!/bin/bash
default_dir="/mnt/d/Documents/GitHub/ansible-vpn"
cd "/home/debian"
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install ansible
cd $default_dir
