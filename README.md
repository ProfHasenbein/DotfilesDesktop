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
git --git-dir=$HOME/DotfilesGNOME --work-tree=$HOME checkout main -- .bashrc .config/install-dotfiles.sh
bash
chmod +x ~/.config/install-dotfiles.sh
```

# Step 4 - execute the script
```
chmod +x ~/.config/dotfiles-install.sh
~/.config/dotfiles-install.sh
```

# step x - fonts
select in the settings

# step x - Brave
import backgrounds and bookmarks

# Step x - Extensions
Go to *Extension Manager* and configure the Extendions. List of Extensions:
![image](https://github.com/user-attachments/assets/49fc15ed-97bf-43b1-ab97-9101ac9bac14)
## Open Bar configuration
import the file

# Step x - Color Scheme
