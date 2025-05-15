#!/bin/bash

echo "🔐 GitHub SSH Key Setup"

# Git global user config setzen
read -p "👤 Enter your Git user.name (e.g. Your Name): " git_name
read -p "📧 Enter your Git user.email (e.g. you@example.com): " git_email

if [ -n "$git_name" ]; then
  git config --global user.name "$git_name"
  echo "✅ Set Git user.name to '$git_name'"
else
  echo "⚠️ No user.name provided, skipping."
fi

if [ -n "$git_email" ]; then
  git config --global user.email "$git_email"
  echo "✅ Set Git user.email to '$git_email'"
else
  echo "⚠️ No user.email provided, skipping."
fi

KEY_PATH="$HOME/.ssh/id_ed25519"

# 1. Check if SSH key already exists
if [ -f "$KEY_PATH" ]; then
    echo "✅ SSH key already exists at $KEY_PATH"
else
    echo "⚙️ No SSH key found. Generating a new one..."
    # Falls keine Email aus Git Config gesetzt wurde, nochmal nachfragen
    email=$(git config --global user.email)
    if [ -z "$email" ]; then
      read -p "Enter your GitHub email address for SSH key comment: " email
    fi
    ssh-keygen -t ed25519 -C "$email" -f "$KEY_PATH"
    eval "$(ssh-agent -s)"
    ssh-add "$KEY_PATH"
fi

# 2. Show the public key so the user can copy it
echo "📋 Your public SSH key (copy this to GitHub):"
echo "-------------------------------------------"
cat "$KEY_PATH.pub"
echo "-------------------------------------------"
echo "💡 Open https://github.com/settings/keys and paste the key there."

# 3. Test the connection to GitHub
read -p "Press [Enter] after you've added the key to GitHub..."
echo "🔗 Testing SSH connection to GitHub..."
ssh -T git@github.com

echo "✅ Done!"
