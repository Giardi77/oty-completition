# Oty Completion Plugin

This is a Zsh plugin that provides autocompletion for the `oty run` command, suggesting file paths under `~/.oty/templates`.

---

## **Installation**

### **1. Download and Install the Plugin**
Run the following command to download and install the plugin:
```bash
bash <(curl -s https://raw.githubusercontent.com/Giardi77/oty-completition/main/install.sh)
```

Or, if you prefer `wget`:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/Giardi77/oty-completition/main/install.sh)
```

---

### **2. Add the Plugin to .zshrc**
During installation, the script will ask whether you want to add the plugin source line to your `.zshrc` file automatically. If you choose not to, you can manually add the following line:
```bash
source "$HOME/.zsh/plugins/oty-completion/oty-completion.plugin.zsh"
```

Then reload your Zsh configuration:
```bash
source ~/.zshrc
```

---

## **Usage**

Once installed, the plugin provides suggestions when you type:
```bash
oty run b<Tab>
```
It will autocomplete file paths located in `~/.oty/templates` that have the extensions `.yaml` or `.yml`.

---

## **Uninstallation**

To remove the plugin:
```bash
rm -rf "$HOME/.zsh/plugins/oty-completion"
```
Then, remove the `source` line from your `.zshrc` file manually if it was added.

---
