# niminit
Copies files from ``~/.config/niminit`` to ``.vscode`` in your current working directory.

Written in nim!

## Compile & Use
To compile ``niminit``, run the following command after cloning:

```bash
nim c -o:bin/niminit niminit
```

This will create a directory called ``bin/`` inside the repo. You can copy the binary into your path from there.

Currently written to work for Linux, not tested for MacOS, Windows is unsupported for now.

To use niminit, run it inside the folder you'd like to initialise, after creating ``~/.config/niminit/`` and adding the files you'd like to copy there.

Optionally, you can pass the ``-g`` flag to also create a git repository.
