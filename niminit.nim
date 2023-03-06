import os
import strutils

var count = 0
for entry in walkDir("."):
    count += 1

if count == 0:
    echo "Initialising..."
else:
    echo "This directory is not empty."
    echo "Continue initialising? [y/N]"
    var input = stdin.readLine()
    case input.toLower
        of "yes", "y", "z", "j":
            echo "Initialising non-empty directory..."
        else:
            echo "Cancelling..."
            quit 0

proc copyFile(src, dest: string): bool =
    try:
        os.copyFile(src, dest)
        echo "Successfully copied ", src, " to ", dest
        return true
    except:
        echo "Failed to copy ", src, " to ", dest
        return false

proc createDir(dir: string): bool =
    try:
        os.createDir(dir)
        echo "Successfully created ", dir
        return true
    except:
        echo "Failed to create ", dir
        return false

let homeDir = getEnv("HOME")
let vscodeDir = ".vscode"
let tasksPath = joinPath(homeDir, "/.config/niminit/tasks.json")
let launchPath = joinPath(homeDir, "/.config/niminit/launch.json")

let vscDirCreated = createDir(vscodeDir)
let tasksCopied = copyFile(tasksPath, joinPath(vscodeDir, "tasks.json"))
let launchCopied = copyFile(launchPath, joinPath(vscodeDir, "launch.json"))

if vscDirCreated and tasksCopied and launchCopied:
    echo "All files copied successfully"
else:
    echo "Failed to copy one or more files"
    quit 1

if "-g" in (commandLineParams()):
    let createdRepo = execShellCmd("git init")
    if createdRepo == 0:
        echo "Successfully created local git repository!"
    else:
        echo: "Failed creating local git repository."

echo "Done!"
