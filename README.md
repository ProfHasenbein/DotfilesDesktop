
# 🎨 DotfilesGNOME

Welcome to my **DotfilesGNOME** repository!  
Here you'll find my personal configuration files and setup scripts for the **GNOME Desktop Environment** on **Fedora Linux**.  
The goal is a beautiful, functional, and streamlined desktop environment with all my favorite tools and tweaks. 🚀

---

## 📁 What's Included

- 🖥️ GNOME configuration files
- 🌟 Terminal prompt with [Starship](https://starship.rs/)
- 🧩 Automatic installation of favorite GNOME extensions
- 💻 App installs (VS Code, Brave, Spotify, Obsidian, Discord, etc.)
- 🔤 Fonts like JetBrains Mono
- 📦 DNF and Flatpak setup
- 🎶 Multimedia codecs via RPM Fusion

---

# ⚡ Quickstart

## Step 1 - download & run the script to setup SSH
```
cd ~
curl -o github-ssh-setup.sh https://raw.githubusercontent.com/ProfHasenbein/DotfilesGNOME/main/.config/github-ssh-setup.sh
chmod +x github-ssh-setup.sh
./github-ssh-setup.sh
```
## Step 2 - clone the bare repo
```
git clone --bare git@github.com:ProfHasenbein/DotfilesGNOME.git $HOME/DotfilesGNOME
```
## Step 3 - get .bashrc & installation script
```
git --git-dir=$HOME/DotfilesGNOME --work-tree=$HOME checkout main -- .bashrc .DotfilesSetupFiles/
bash
chmod +x ~/.config/install-dotfiles.sh
source ~/.bashrc
```

## Step 4 - execute the script
```
chmod +x ~/.config/dotfiles-install.sh
~/.config/dotfiles-install.sh
```
## Step 5 - get the remaining files
```
config fetch origin '+refs/heads/*:refs/remotes/origin/*'
config reset --hard origin/main
```

## Step x - fonts
select JetBrains Mono Font in the settings

## Step x - Brave
import [backgrounds](.DotfilesSetupFiles/BraveBackgrounds/) and [.DotfilesSetupFiles/bookmarks](.DotfilesSetupFiles) from the [.DotfilesSetupFiles](.DotfilesSetupFiles) folder

## Step x - Extensions
Go to *Extension Manager* and configure the Extentions. List of Extensions:
![image](https://github.com/user-attachments/assets/49fc15ed-97bf-43b1-ab97-9101ac9bac14)
### Open Bar configuration
import the file from the [.DotfilesSetupFiles](.DotfilesSetupFiles) folder

## Step x - Color Scheme
Use color picker for color scheme in the properties section of the terminal:
![image](https://github.com/user-attachments/assets/c295b86b-9aae-45bc-9415-d7f236ab516e)

