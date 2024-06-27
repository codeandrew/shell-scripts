# Nvim installation

```bash
brew install nvim 
sudo apt install -y neovim
#git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1
git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 2
echo "[!] Don't Install example configuration. say N"

rm -rf ~/.config/nvim/lua/custom
git clone https://github.com/dreamsofcode-io/neovim-python.git  ~/.config/nvim/lua/custom

# restart nvim
:MasonInstallAll

# restart nvim
:TSInstall python

# Check if PyRight is working
:LspInfo
```

## NERD FONT INSTALLATION ubuntu

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip

# update font-cache -fv
```
