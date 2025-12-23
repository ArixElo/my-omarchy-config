#!/bin/bash
echo "Checking if you have installed required packages..."
sudo yay -Qi cava wttrbar kitty
echo "installing required packages..."
sudo omarchy-install-terminal kitty
sudo yay -S cava wttrbar
echo "Copying all configs to ~/.config..."
cp -r *.* ~/.config
echo "Restarting waybar..."
sudo pkill waybar && hyprctl dispatch exec waybar
echo "Applying config is done, but for better experience: Change your location for wttrbar, and reboot your machine."