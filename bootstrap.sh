#!/bin/sh

echo "---------- INSTALLING NALA ----------"
sudo apt update -y && sudo apt install nala -y

echo "\n---------- SETTING UP NALA SERVERS ----------"
echo "1 2 3" | sudo nala fetch -y

echo "---------- UPGRADING SYSTEM WITH NALA ----------"
sudo nala upgrade -y
