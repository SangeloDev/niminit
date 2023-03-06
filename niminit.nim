import os
import strutils
import strformat

when defined(windows):
    echo "Warning: Windows is currently unsupported!"
    quit 1
when defined(macOS):
    echo "Warning: macOS is currently untested. Would you like to continue? [y/N]"
    var input = stdin.readLine()
    case input.toLower
        of "yes", "y", "z", "j":
            echo "Initialising non-empty directory..."
        else:
            echo "Cancelling..."
            quit 0

# Check for files in directory
var count = 0
for entry in walkDir("."):
    count += 1
# If there are files, ask for confirmation, otherwise continue.
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

# Define how to handle failed copies
proc copyFile(src, dest: string): bool =
    try:
        os.copyFile(src, dest)
        echo "Successfully copied ", src, " to ", dest
        return true
    except:
        echo "Failed to copy ", src, " to ", dest
        return false

# Define how to handle failed directory creations
proc createDir(dir: string): bool =
    try:
        os.createDir(dir)
        echo "Successfully created ", dir
        return true
    except:
        echo "Failed to create ", dir
        return false

# Define how to handle configuring a git repo
proc configureGitRepo(gitRemote, gitBranch: string) =
    let setupGitRepo = execShellCmd(&"git remote add origin {gitRemote}")
    let setGitBranch = execShellCmd(&"git branch -m {gitBranch}")
    if setupGitRepo == 0:
        echo &"Successfully added remote {gitRemote}"
    else:
        echo &"Failed to add remote {gitRemote}"
    if setGitBranch == 0:
        echo &"Successfully set branch to {gitBranch}"
    else:
        echo &"Failed to set branch {gitBranch}"

#-------------------------------------------------------------------------------#

# Set necessary variables (home directory, config path)
let homeDir = getEnv("HOME")
let vscodeDir = ".vscode"
let tasksPath = joinPath(homeDir, "/.config/niminit/tasks.json")
let launchPath = joinPath(homeDir, "/.config/niminit/launch.json")

# Create .vscode directory and copy files into it
let vscDirCreated = createDir(vscodeDir)
let tasksCopied = copyFile(tasksPath, joinPath(vscodeDir, "tasks.json"))
let launchCopied = copyFile(launchPath, joinPath(vscodeDir, "launch.json"))

# Check for success and quit if command errored
if vscDirCreated and tasksCopied and launchCopied:
    echo "All files copied successfully"
else:
    echo "Failed to copy one or more files"
    quit 1

# Handle -g parameter for git repos.
if "-g" in (commandLineParams()):
    let createdRepo = execShellCmd("git init")
    if createdRepo == 0:
        echo "Successfully initialised local git repository!"
        echo "Would you like to configure it? [Y/n]"
        var input = stdin.readLine()
        case input.toLower
        of "yes", "y", "z", "j", "":
            echo "Enter the git remote:"
            let gitRemote = stdin.readLine()
            echo "Enter your desired branch name:"
            let gitBranch = stdin.readLine()
            echo "Configuring Git repo..."
            configureGitRepo(gitRemote, gitBranch)
        else:
            echo "Skipping repository configuration..."
            echo "Successfully created local git repository!"
    else:
        echo: "Failed creating local git repository."

echo "Done!"