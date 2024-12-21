# ~/.zsh/plugins/oty-completion/oty-completion.plugin.zsh

# Ensure the directory exists
OTY_TEMPLATES_DIR="$HOME/.oty/templates"

# Define the completion function
_oty_run_completion() {
  # Collect absolute paths for .yaml and .yml files only, replacing $HOME with ~
  local -a suggestions
  suggestions=($(find "$OTY_TEMPLATES_DIR" -type f \( -name "*.yaml" -o -name "*.yml" \) | sed "s|^$HOME|~|"))

  # Add suggestions without escaping and suppress any trailing suffixes
  compadd -Q -S '' -a suggestions
}

# Register the completion function specifically for 'oty run'
compdef _oty_run_completion 'oty run'
