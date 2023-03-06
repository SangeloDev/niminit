#!/bin/bash
# Install Script for niminit v1.0
# (c) Sangelo, 2023
# Read LICENSE for more info

# Check for macOS
if [[ $OSTYPE == 'darwin'* ]]; then
    read -p "Warning: MacOS is currently untested. If there's any issues, please report them on GitHub.\n Are you sure you want to continue? [y/N] " macOSChoice
    case
        [yY][eE][sS]|[yY]|[zZ]|[jJ])
            echo "Continuing with experimental support..."
            ;;
        *)
            echo "Exiting..."
            exit 0
            ;;
    esac
fi

# Compile program
nim c -o:bin/niminit niminit

# Create local bin folder if it doesn't exist
mkdir -p $HOME/.local/bin

# Copy binary to local bin folder
cp bin/niminit $HOME/.local/bin/niminit

# Create config directory & copy files
mkdir -p $HOME/.config/niminit
cp config/* $HOME/.config/niminit

# Print info message to export local bin if not already
echo -e "\n"
echo -e "\e[92m>>> \e[0mDone! If you haven't already added your local bin folder to your PATH, you can do so by adding the following line to your .profile, .bashrc or .zshrc"
echo -e "\e[1m\e[91mexport \e[0m\e[33m\$HOME./local/bin:\$PATH"