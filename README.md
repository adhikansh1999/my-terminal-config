# Terminal Configuration

A repository containing scripts and configuration files for setting up a feature-rich terminal environment with Zsh.

## Components

This repository sets up the following terminal enhancements:

### 1. zsh-autosuggestions
Suggests commands as you type based on your command history, making command entry faster and more efficient.

### 2. zsh-autocomplete
Provides real-time completions for Zsh, showing all available completions as you type.

### 3. zoxide
A smarter cd command that remembers your most frequently used directories and allows quick navigation.

### 4. Powerlevel10k
A highly customizable Zsh theme with blazing fast performance and many visual features.

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/my-terminal-config.git
   cd my-terminal-config
   ```

2. Make the setup script executable:
   ```bash
   chmod +x setup.sh
   ```

3. Run the setup script:
   ```bash
   ./setup.sh
   ```

4. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```

## What the Setup Script Does

The `setup.sh` script automates the following tasks:

1. Installs zsh-autosuggestions and adds it to your .zshrc
2. Installs zsh-autocomplete and adds it to your .zshrc
3. Installs zoxide and configures it in your .zshrc
4. Installs Powerlevel10k theme for Zsh
5. Copies the included .p10k.zsh configuration file to your home directory

The script checks for existing installations before proceeding and only adds configuration lines to your .zshrc if they don't already exist.

## Customization

### Modifying Powerlevel10k Configuration

You can customize your Powerlevel10k theme by:

1. Running `p10k configure` for the guided setup
2. Manually editing `~/.p10k.zsh` for fine-grained control

### Zsh Autosuggestions

Adjust the suggestion strategy in your `.zshrc`:
```bash
# Options: history, completion, match_prev_cmd
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
```

### Zoxide

Use the following commands to navigate with zoxide:
- `z folder` - Jump to a directory that contains 'folder'
- `z foo bar` - Jump to a directory that contains 'foo' and then 'bar'
- `zi` - Interactive selection from your directory history

## Troubleshooting

### Common Issues

1. **Theme doesn't look right**: Make sure your terminal is using a [Nerd Font](https://www.nerdfonts.com/) for proper icon display.

2. **Slow startup time**: If your terminal is slow to start up, try:
   ```bash
   # Add to the top of your .zshrc
   zmodload zsh/zprof
   # Add to the bottom of your .zshrc
   zprof
   ```
   This will profile your startup time and help identify slow plugins.

3. **Conflicts with other plugins**: If you experience conflicts, try changing the loading order in your .zshrc.

### Updating Components

To update the installed components, simply run the setup script again:
```bash
./setup.sh
```

The script will detect existing installations and update them.

## License

MIT License - Feel free to use, modify, and distribute as you like.
