#!/bin/bash

function __install() {
    clear

   
cat <<\EOF
    ___         _      ________     _          ____                            __             ______            _____      
   /   |  _____(_)  __/ ____/ /___ ( )_____   / __ \____ ___  ____ ___________/ /_  __  __   / ____/___  ____  / __(_)___ _
  / /| | / ___/ / |/_/ __/ / / __ \|// ___/  / / / / __ `__ \/ __ `/ ___/ ___/ __ \/ / / /  / /   / __ \/ __ \/ /_/ / __ `/
 / ___ |/ /  / />  </ /___/ / /_/ / (__  )  / /_/ / / / / / / /_/ / /  / /__/ / / / /_/ /  / /___/ /_/ / / / / __/ / /_/ / 
/_/  |_/_/  /_/_/|_/_____/_/\____/ /____/   \____/_/ /_/ /_/\__,_/_/   \___/_/ /_/\__, /   \____/\____/_/ /_/_/ /_/\__, /  
                                                                                 /____/                           /____/ 
EOF
    printf "%s\n\n" "(c) Copyright, ArixElo ~ 2025."

    echo "Checking if you have installed required packages..."
    
    if yay -Qi cava &>/dev/null && yay -Qi kitty &>/dev/null && yay -Qi wttrbar &>/dev/null && yay -Qi starship &>/dev/null && yay -Qi zsh &>/dev/null && yay -Qi zsh-autosuggestions &>/dev/null && yay -Qi zsh-syntax-highlighting &>/dev/null; then
        echo "It looks like you have already installed all packages"
        __copy
    else
        echo "Installing required packages..."
        yay -S cava wttrbar kitty starship zsh zsh-autosuggestions zsh-syntax-highlighting
        __copy
    fi
}

function __copy() {
    echo "Copying all configs to ~/.config and ~/.local also changing your terminal and your shell..."
    cp -r */ ~/.config/
    cp tiling-v2.conf ~/.local/share/omarchy/default/hypr/bindings
    cat "kitty.desktop" > ~/.config/xdg-terminals.list
    chsh $USER /usr/bin/zsh && sudo chsh /usr/bin/zsh
    cp .zshrc ~/home/$USER/
    touch .config/zsh/history
    source ~/.zshrc
    echo "Restarting waybar..."
    pkill waybar && hyprctl dispatch exec waybar
    echo "Applying config is done, but for better experience: Change your location for wttrbar, and reboot your machine."
}

__install