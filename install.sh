#!/bin/bash
# Install Script for niminit v1.0
# (c) Sangelo, 2023
# Read LICENSE for more info

# Compile program
nim c -o:bin/niminit niminit

# Create local bin folder if it doesn't exist
mkdir -p $HOME/.local/bin

# Copy binary to local bin folder
cp bin/niminit $HOME/.local/bin/niminit

# Print info message to export local bin if not already
echo -e "\n"
echo -e "\e[92m>>> \e[0mDone! If you haven't already added your local bin folder to your PATH, you can do so by adding the following line to your .profile, .bashrc or .zshrc"
echo -e "\e[1m\e[91mexport \e[0m\e[33m\$HOME./local/bin:\$PATH"