# DotfilesGNOME
In this repo I upload my Dotfiles for GNOME 

# Step 1 - download & run the script to setup SSH
```
cd ~
curl -o github-ssh-setup.sh https://raw.githubusercontent.com/ProfHasenbein/DotfilesGNOME/main/.config/github-ssh-setup.sh
chmod +x github-ssh-setup.sh
./github-ssh-setup.sh
```
# Step 2 - clone the bare repo
```
git clone --bare git@github.com:ProfHasenbein/DotfilesGNOME.git $HOME/DotfilesGNOME
```
# Step 3 - get .bashrc & installation script
```
git --git-dir=$HOME/DotfilesGNOME --work-tree=$HOME checkout main -- .bashrc .config/dotfiles-install.sh
bash
chmod +x ~/.config/dotfiles-install.sh
```
~/.config/dotfiles-install.sh  //spaeter hinzufuegen
# step x - fonts
# step x - Brave
# Step x - Extensions

![image](https://github.com/user-attachments/assets/49fc15ed-97bf-43b1-ab97-9101ac9bac14)
