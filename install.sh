#!/bin/bash

PLUGIN_URL="https://raw.githubusercontent.com/Giardi77/oty-completition/refs/heads/main/oty-completion.plugin.zsh"
PLUGIN_DIR="$HOME/.zsh/plugins/oty-completion"
PLUGIN_FILE="$PLUGIN_DIR/oty-completion.plugin.zsh"

# Create the plugin directory if it doesn't exist
mkdir -p "$PLUGIN_DIR"

# Download the plugin
if command -v wget &> /dev/null; then
    wget -O "$PLUGIN_FILE" "$PLUGIN_URL"
elif command -v curl &> /dev/null; then
    curl -o "$PLUGIN_FILE" "$PLUGIN_URL"
else
    echo "Neither wget nor curl is available. Please install one of them and re-run the script."
    exit 1
fi

# Verify download
if [[ ! -f "$PLUGIN_FILE" ]]; then
    echo "Failed to download the plugin file."
    exit 1
fi

echo "Plugin downloaded successfully to $PLUGIN_FILE."

# Ask user whether to add source line to .zshrc
read -p "Would you like to add the source command to your .zshrc? [y/N]: " ADD_TO_ZSHRC
if [[ "$ADD_TO_ZSHRC" =~ ^[Yy]$ ]]; then
    SOURCE_CMD="source \"$PLUGIN_FILE\""

    # Check if already sourced
    if ! grep -q "source .*oty-completion.plugin.zsh" "$HOME/.zshrc"; then
        echo "$SOURCE_CMD" >> "$HOME/.zshrc"
        echo "Source command added to .zshrc."
    else
        echo "Source command is already present in .zshrc."
    fi

    # Inform user to reload .zshrc manually
    echo "To apply changes, please reload your shell by running: source ~/.zshrc"
else
    echo "You can manually source the plugin by adding this line to your .zshrc:"
    echo "source \"$PLUGIN_FILE\""
fi

