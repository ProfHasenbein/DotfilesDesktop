#!/bin/bash

echo "🔐 GitHub SSH Key Setup"

KEY_PATH="$HOME/.ssh/id_ed25519"

# 1. Check if SSH key already exists
if [ -f "$KEY_PATH" ]; then
    echo "✅ SSH key already exists at $KEY_PATH"
else
    echo "⚙️ No SSH key found. Generating a new one..."
    read -p "Enter your GitHub email address: " email
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
