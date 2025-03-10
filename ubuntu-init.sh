# Description: init ubuntu 20.04
# Author: Ascian
# type exit to continue installing

# add apt repository wslu
sudo add-apt-repository ppa:wslutilities/wslu

# update apt
sudo apt update

# install zsh
sudo apt install zsh
chsh -s $(which zsh)
zsh

# install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# install common plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install starship
curl -sS https://starship.rs/install.sh | sh

# install programs using apt
sudo apt install bat fd-find tree ripgrep nodejs npm shellcheck wslu

# install programs using npm
sudo npm install -g tldr

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install broot
curl -o broot -L https://dystroy.org/broot/download/x86_64-linux/broot
sudo mv broot /usr/local/bin/broot
sudo chmod +x /usr/local/bin/broot
broot --install

# no sure if there is no problems
# using Visual Studio Code
# add alias code='"/mnt/c/Users/Ascian/AppData/Local/Programs/Microsoft VS Code/Code.exe"' in .zshrc

# install cuda
sudo apt-key del 7fa2af80
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.0.0/local_installers/cuda-repo-wsl-ubuntu-12-0-local_12.0.0-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-12-0-local_12.0.0-1_amd64.deb
sudo cp /var/cuda-repo-wsl-ubuntu-12-0-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
rm cuda-repo-wsl-ubuntu-12-0-local_12.0.0-1_amd64.deb

# install anaconda
wget https://repo.anaconda.com/archive/Anaconda3-2022.10-L
inux-x86_64.sh
bash Anaconda3-2022.10-Linux-x86_64.sh
rm Anaconda3-2022.10-Linux-x86_64.sh
conda config --set auto_activate_base false
conda config --add channels conda-forge
conda update -n base -c defaults conda
conda config --set remote_read_timeout_secs 1000.0

# install chezmoi
wget https://github.com/twpayne/chezmoi/releases/download/v2.31.0/chezmoi_2.31.0_linux_amd64.deb
sudo dpkg -i chezmoi_2.31.0_linux_amd64.deb
rm chezmoi_2.31.0_linux_amd64.deb

# extract dotfiles through chezmoi
chezmoi init --apply https://github.com/Ascian/dotfiles.git

# install Chinese font
sudo apt-get install fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming
