```
╔╦╗┌─┐┌┬┐┌─┐┬┬  ┌─┐┌─┐  ╔═╗╔╗╔╔═╗╔╦╗╔═╗
 ║║│ │ │ ├┤ ││  ├┤ └─┐  ║ ╦║║║║ ║║║║║╣ 
═╩╝└─┘ ┴ └  ┴┴─┘└─┘└─┘  ╚═╝╝╚╝╚═╝╩ ╩╚═╝
```
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

## 🛠 Step 1 — Set up SSH
```bash
cd ~
curl -o github-ssh-setup.sh https://raw.githubusercontent.com/ProfHasenbein/DotfilesGNOME/main/.config/github-ssh-setup.sh
chmod +x github-ssh-setup.sh
./github-ssh-setup.sh
````

## 📥 Step 2 — Clone the bare repo

```bash
git clone --bare git@github.com:ProfHasenbein/DotfilesGNOME.git $HOME/DotfilesGNOME
```

## 📂 Step 3 — Get `.bashrc` & installation script

```bash
git --git-dir=$HOME/DotfilesGNOME --work-tree=$HOME checkout main -- .bashrc .DotfilesSetupFiles/
bash
chmod +x ~/.config/install-dotfiles.sh
source ~/.bashrc
```

## ▶️ Step 4 — Execute the install script

```bash
chmod +x ~/.config/dotfiles-install.sh
~/.config/dotfiles-install.sh
```

## 📦 Step 5 — Get the remaining dotfiles

```bash
config fetch origin '+refs/heads/*:refs/remotes/origin/*'
config reset --hard origin/main
```

---

## 🅰️ Optional Final Steps

### 🔤 Fonts

Select **JetBrains Mono** in the GNOME settings after installation.

---

### 🦁 Brave Browser

Import:

* **Backgrounds** from `.DotfilesSetupFiles/BraveWallpapers/`
* **Bookmarks** from `.DotfilesSetupFiles/bookmarks_dd_mm_yyyy.html`

---

### 🧩 Extensions

Open the **Extension Manager** and enable/configure the following:

![image](https://github.com/user-attachments/assets/6a162065-881c-4711-b524-fcf795dcad96)

* Blur my Shell
* Brightness control using ddcutil
* Clipboard Indicator
* Color Picker
* Open Bar
* Quake Terminal
* Screenshot-cut
* Switch Workspace
* Vitals

> The install script handles automatic installation. Just configure them afterward via the Extension Manager.

---

#### ⚙️ Open Bar Configuration

Import the config file from:
`.DotfilesSetupFiles/UpenBarSettings`

---

### 🎨 Terminal Color Scheme

Use the **Color Picker** to select a matching color scheme in the GNOME Terminal appearance settings:
![image](https://github.com/user-attachments/assets/fb78ce8f-80c2-4677-b872-642d2521ddf0)

---

## 🧪 Tested On

* ✅ Fedora Workstation 41 & 42
* ✅ GNOME (Wayland)
* ✅ Clean install

---

## ☁️ License

MIT — use freely, but credit is appreciated! ❤️

---
