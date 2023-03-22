# niminit
Simple program that copies files from `~/.config/niminit` to `.vscode` in your current working directory and optionally initialises a Git repo.

Written in nim!

Currently written to work for Linux, not tested on MacOS, Windows is unsupported for now (feel free to make a pull-request :D).

This repository is available on [Gitpot](https://gitpot.dev/sangelo/niminit) as a mirror!

## Table of contents
- [Install using script](#install-using-script)
- [Compile & install manually](#compile--install-manually)
- [Update](#update)
- [Usage](#usage)
- [Uninstall](#uninstall)

## Install using script
Install using one-liner:
```bash
# Clone the repo, compile and install niminit

## Clone from Gitpot
git clone https://gitpot.dev/sangelo/niminit && cd niminit && chmod +x install.sh && ./install.sh
## Clone from GitHub
git clone https://github.com/SangeloDev/niminit && cd niminit && chmod +x install.sh && ./install.sh
```

If you've cloned the repo already, you can also directly run install.sh:
```bash
$ ./install.sh
```

## Compile & install manually
To compile `niminit`, run the following command after cloning:

```bash
nim c -o:bin/niminit niminit
```

This will create a directory called `bin/` inside the repo. You can copy the binary into your path from there.

You'll also find two template files that can be used to initialise a nim project for VSCode inside `config` in this repo. You can copy these to `~/.config/niminit` or create your own.

## Update
1. Open your terminal and `cd` into the repository.
2. Run `git pull` to update the local repo.
3. Run `./install.sh` again and enjoy! (You might have to make it executable again using `chmod +x install.sh`)

## Usage
To use niminit, run it inside the folder you'd like to initialise, after creating ``~/.config/niminit/`` and adding the files you'd like to copy there.

Optionally, you can pass the ``-g`` flag to also create a git repository.

## Uninstall
`niminit` is self-contained, you can just remove the binary from `~/.local/bin`.
`niminit` also uses `~/.config/niminit`, so remove that directory and you're done!

---
[Back to the top](#niminit)
