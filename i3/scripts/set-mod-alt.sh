#!/bin/bash

#This script blindly assumes that you only move between alt and super
# 
sed -i 's/set $mod Mod4/set $mod Mod1/' ~/.config/i3/config
touch /home/pthrill/iran
