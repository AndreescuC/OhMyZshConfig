#!/bin/bash

{
	# Install oh-my-zsh
	echo "===> Installing oh-my-zsh"
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
} || {
	echo "===> Something went wrong when installing oh-my-zsh!"
}

# Use custom theme
echo "===> Setting theme"
sed -i '/ZSH_THEME=".*"/c\ZSH_THEME="nebirhos"' ~/.zshrc

# Use my aliases
echo "===> Creating aliases"
{
	mkdir ~/.zsh
} || {
	echo "===> Unable to create directory, assuming it is created"
}
printf '\nalias ..="cd .."\nalias ...="cd ../.."\nalias ....="cd ../../.."\nalias .....="cd ../../../.."\n\nalias grep="nocorrect grep --color=auto"\n\nalias ll="ls -lh"\nalias run-help=man\nalias which-command=whence\n\nalias mark="pwd > ~/.sd"\nalias port="cd $(cat ~/.sd)"\nalias ll="ls -alF"' > ~/.zsh/aliasrc 
printf '\nsource ~/.zsh/aliasrc\n' >> ~/.zshrc
