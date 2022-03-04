#!/bin/bash

ln -s ./.config/fish/config.fish ~/.config/fish/config.fish

# Installing apt packages
declare -a packages=("fish")

for package in "${packages[@]}"
do
	PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $package|grep "install ok installed")
	if [ "" = "$PKG_OK" ]; then
  		echo "---------- $package not installed. Installing $package. ----------"
  		sudo apt-get --yes install $package
	else
		echo "---------- $package already exists ----------"
	fi
done

echo "---------- Installing Oh-My-Fish ----------"
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "---------- Installing fisher ----------"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

echo "---------- Installing Starship prompt ----------"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

echo "Setting fish as default prompt"
sudo chsh -s /usr/bin/fish codespace

