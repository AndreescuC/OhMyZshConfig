#!/bin/bash

echo "===> Removing old installs"
rm -rf  ~/.oh-my-zsh || echo "===> No oh-my-zsh directory to remove"
sudo rm -rf  /root/.oh-my-zsh || echo "===> No root oh-my-zsh directory to remove"

{
	# Install oh-my-zsh
	echo "===> Installing oh-my-zsh"
	read -n 1 -r -s -p $'[*******************************************************************************************]\nWhen prompted if you want to set zsh as default shell, answer "no"("n")\nAfter zsh is installed, run "exit" to exit the created shell and continue with the executuon of this script.\nPress any key to continue...\n'
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
} || {
	echo "===> Something went wrong when installing oh-my-zsh!"
}

# Make zsh default shell
echo "===> Making zsh default shell"
if ! grep -Fxq "/usr/bin/zsh" /etc/shells
then
	sudo printf "\n/usr/bin/zsh\n" | sudo tee -a /etc/shells
fi
sudo chsh -s /usr/bin/zsh $USER

# Use custom theme
echo "===> Executing post-install steps"
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

# Color git
printf '\ngit config --global color.ui auto\n' >> ~/.zshrc

zsh -c 'echo "===> Setup finished, reloding config"; source ~/.zshrc'
