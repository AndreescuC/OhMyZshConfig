#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Use custom theme
printf '\nZSH_THEME="nebirhos"\n' >> ~/.zshrc

# Use my aliases
mkdir ~/.zsh
printf '\nalias ..="cd .."\nalias ...="cd ../.."\nalias ....="cd ../../.."\nalias .....="cd ../../../.."\n\nalias grep="nocorrect grep --color=auto"\n\nalias ll="ls -lh"\nalias run-help=man\nalias which-command=whence\n\nalias mark="pwd > ~/.sd"\nalias port="cd $(cat ~/.sd)"\nalias ll="ls -alF"' > ~/.zsh/aliasrc 

printf '\nsource ~/.zsh/aliasrc\n' >> ~/.zshrc
