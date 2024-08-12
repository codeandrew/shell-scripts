#!/bin/bash

backup_nvim(){
    mv ~/.config/nvim ~/.config/nvim.bak
    rm -rf ~/.local/share/nvim
}

install_nvim(){
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Check if it's Ubuntu or Debian
        if [ -f /etc/debian_version ]; then
            sudo apt update
            sudo apt install -y neovim
        else
            echo "Unsupported Linux distribution. Please install Neovim manually."
            exit 1
        fi

    elif [[ "$OSTYPE" == "darwin"* ]]; then
        brew install nvim
    else
        echo "Unsupported operating system. Please install Neovim manually."
        exit 1
    fi

    # latest is breaking changes with current config
    # git clone https://github.com/NvChad/starter ~/.config/nvim --depth 1
    git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
    cat << END
[!] Attention, this stuff needs to be done manually
    open another terminal and open nvim

[!] Don't Install example configuration. say N

    Change theme: space t h
    catppucin

    Cheet Sheets:       space c h
    open terminak :     space v # vertical
                        space h # horizontal
END

    read -p "restart nvim"
    #git clone git@github.com:dreamsofcode-io/neovim-python.git ~/.config/nvim/lua/custom
    rm -rf ~/.config/nvim/lua/custom
    git clone https://github.com/dreamsofcode-io/neovim-python.git  ~/.config/nvim/lua/custom
    cat << END
# restart nvim
:MasonInstallAll

# restart nvim
:TSInstall python

# Check if PyRight is working
:LspInfo
END
}

uninstall_nvim(){
    rm -rf ~/.config/nvim
    rm -rf ~/.local/state/nvim
    rm -rf ~/.local/share/nvim
}

download_nerdfonts(){
    # https://www.nerdfonts.com/font-downloads
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
    cat << END
[!] Unzip JetBrainsMono.zip then install font.

Open Terminal Preferences:
- For the default Terminal app, go to Terminal > Preferences.
- For iTerm2, go to iTerm2 > Preferences > Profiles > Text.

Your Terminal must use the 'Jet Brains Mono Nerd Font'.
so the file tree can display the right icons
END
}

# main ---- 

backup_nvim
download_nerdfonts
install_nvim

