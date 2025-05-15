#!/bin/bash

echo "🐧 Fedora Dotfiles Setup Script"
echo "------------------------------"

########################################
# 1️⃣ Hostname setzen
########################################

read -p "🖥️  Enter a hostname [default: fedora]: " new_hostname
new_hostname=${new_hostname:-fedora}

echo "🔧 Setting hostname to '$new_hostname'..."
sudo hostnamectl set-hostname "$new_hostname"
echo "✅ Hostname set."


########################################
# 2️⃣ RPM Fusion aktivieren
########################################

echo "📦 Enabling RPM Fusion repositories..."
sudo dnf install -y \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
echo "✅ RPM Fusion enabled."


########################################
# 3️⃣ Gruppenpakete von RPM Fusion
########################################

echo "📚 Installing RPM Fusion group packages..."
sudo dnf install -y rpmfusion-*-appstream-data
echo "✅ Group packages installed."


########################################
# 4️⃣ Flathub für Flatpak
########################################

echo "📦 Adding Flathub repository for Flatpak..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "✅ Flathub added."


########################################
# 5️⃣ Multimedia-Codecs
########################################

echo "🎵 Installing multimedia codecs..."
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf groupupdate -y sound-and-video
echo "✅ Multimedia support ready."


########################################
# 6️⃣ JetBrains Mono installieren
########################################

echo
echo "🔤 Installing JetBrains Mono Font"
echo "---------------------------------"

FONT_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/jetbrains-mono-font"
ZIP_URL="https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip"

mkdir -p "$FONT_DIR" "$TMP_DIR"
cd "$TMP_DIR" || exit

echo "📥 Downloading JetBrains Mono..."
curl -L -o jetbrains.zip "$ZIP_URL"

echo "📦 Extracting..."
unzip -o jetbrains.zip -d "$TMP_DIR"

echo "📂 Copying TTF files to $FONT_DIR..."
cp "$TMP_DIR/fonts/ttf/"*.ttf "$FONT_DIR/"

echo "🔄 Updating font cache..."
fc-cache -f

echo "🧹 Cleaning up..."
rm -rf "$TMP_DIR"
echo "✅ JetBrains Mono font installed!"

########################################
# 🔄 /etc/dnf/dnf.conf ersetzen
########################################

echo "⚙️ Replacing /etc/dnf/dnf.conf with custom version..."

if [[ -f "$HOME/.DotfilesSetupFiles/dnf.conf" ]]; then
    sudo cp $HOME/.DotfilesSetupFiles/dnf.conf /etc/dnf/dnf.conf
    echo "✅ dnf.conf replaced successfully."
else
    echo "❌ Custom dnf.conf not found at DotfilesSetupFiles/dnf.conf"
fi


########################################
# 7️⃣ Optional: Programme installieren
########################################

echo
echo "🛠️  Would you like to install additional programs? (VS Code, GNOME Tweaks, etc.)"
read -p "👉 Continue? [Y/n]: " install_programs

if [[ "$install_programs" =~ ^[Yy]$ || -z "$install_programs" ]]; then
    echo "📥 Installing additional programs..."

    # dnf packages
    echo "📦 Installing fontawesome-fonts..."
    sudo dnf install fontawesome-fonts

    # pip installieren (nur wenn nötig)
    echo "📦 Installing pip3..."
    sudo dnf install -y python3-pip

    # ⚠️ Achtung: pip + gnome-extensions-cli kann instabil sein!
    echo "📥 Attempting to install gnome-extensions-cli..."
    pip3 install --user gnome-extensions-cli || echo "⚠️ Failed to install gnome-extensions-cli"
    export PATH="$HOME/.local/bin:$PATH"

    # DNF Programme
    echo "📦 Installing via dnf: GNOME Tweaks, Thunderbird, Steam..."
    sudo dnf install -y gnome-tweaks thunderbird steam

    # Flatpak Programme
    echo "📦 Installing via flatpak: VS Code, Spotify, Obsidian, Discord, Brave, Anki, Extension Manager..."
    flatpak install -y flathub com.visualstudio.code
    flatpak install -y flathub com.spotify.Client
    flatpak install -y flathub md.obsidian.Obsidian
    flatpak install -y flathub com.discordapp.Discord
    flatpak install -y flathub com.brave.Browser
    flatpak install -y flathub net.ankiweb.Anki
    flatpak install -y flathub com.mattjakeman.ExtensionManager

    echo "✅ All selected programs installed."


    ########################################
    # 8️⃣ Starship Prompt installieren
    ########################################

    echo "🌟 Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    echo "✅ Starship installed."


    ########################################
    # 9️⃣ GNOME Extensions installieren
    ########################################

    echo "🧩 Installing GNOME Extensions..."

    EXTENSIONS=(
      "blur-my-shell@aunetx"
      "display-brightness-ddcutil@themightydeity.github.com"
      "clipboard-indicator@tudmotu.com"
      "color-picker@tuberry"
      "openbar@neuromorph"
      "quake-terminal@diegodario88.github.io"
      "screenshot-cut@paulomion"
      "switchWorkSpace@sun.wxg@gmail.com"
      "Vitals@CoreCoding.com"
    )

    for ext in "${EXTENSIONS[@]}"; do
      echo "📦 Installing $ext"
      gnome-extensions-cli install "$ext" || echo "⚠️ Failed to install $ext"
      gnome-extensions enable "$ext" || echo "⚠️ Failed to enable $ext"
    done

    echo "✅ All extensions processed."

else
    echo "⏩ Skipping program installation."
fi


########################################
# 🎉 Abschlussmeldung
########################################

echo
echo "🎉 Setup complete! Enjoy your Fedora system, $new_hostname!"
