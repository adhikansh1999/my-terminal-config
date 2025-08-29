#!/bin/bash

# Terminal Configuration Setup Script
# This script installs and configures various terminal enhancements:
# - zsh-autosuggestions
# - zsh-autocomplete
# - zoxide
# - powerlevel10k theme
# - copies custom p10k configuration

set -e

# Save the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting terminal configuration setup..."

# Create .zsh directory if it doesn't exist
mkdir -p ~/.zsh

# Install zsh-autosuggestions
echo "Installing zsh-autosuggestions..."
if [ -d ~/.zsh/zsh-autosuggestions ]; then
  echo "zsh-autosuggestions already installed, updating..."
  cd ~/.zsh/zsh-autosuggestions && git pull
else
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

# Add zsh-autosuggestions to .zshrc if not already present
if ! grep -q "zsh-autosuggestions.zsh" ~/.zshrc; then
  echo "Adding zsh-autosuggestions to .zshrc..."
  echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
fi

# Install zsh-autocomplete
echo "Installing zsh-autocomplete..."
if [ -d ~/.zsh/zsh-autocomplete ]; then
  echo "zsh-autocomplete already installed, updating..."
  cd ~/.zsh/zsh-autocomplete && git pull
else
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh/zsh-autocomplete
fi

# Add zsh-autocomplete to .zshrc if not already present
if ! grep -q "zsh-autocomplete.plugin.zsh" ~/.zshrc; then
  echo "Adding zsh-autocomplete to .zshrc..."
  echo "source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh" >> ~/.zshrc
fi

# Install zoxide
echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# Add zoxide init to .zshrc if not already present
if ! grep -q "zoxide init zsh" ~/.zshrc; then
  echo "Adding zoxide initialization to .zshrc..."
  echo 'eval "$(zoxide init zsh)"' >> ~/.zshrc
fi

# Install powerlevel10k
echo "Installing powerlevel10k..."
if [ -d ~/powerlevel10k ]; then
  echo "powerlevel10k already installed, updating..."
  cd ~/powerlevel10k && git pull
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
fi

# Add powerlevel10k to .zshrc if not already present
if ! grep -q "powerlevel10k.zsh-theme" ~/.zshrc; then
  echo "Adding powerlevel10k to .zshrc..."
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
fi

# Copy the p10k configuration file
echo "Copying p10k configuration file..."
cp "$SCRIPT_DIR/.p10k.zsh" ~/.p10k.zsh

# Add p10k config source to .zshrc if not already present
if ! grep -q "\[\[ ! -f ~/.p10k.zsh \]\] || source ~/.p10k.zsh" ~/.zshrc; then
  echo "Adding p10k configuration to .zshrc..."
  echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
fi

echo "Setup complete! Please restart your terminal or run 'source ~/.zshrc' to apply changes."
