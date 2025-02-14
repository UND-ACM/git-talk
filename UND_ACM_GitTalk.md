# Git and Github

"I'm an egotistical bastard, and I name all my projects after myself. First Linux, now git." - Linus Torvalds, creator of Linux and git

## Introduction

### Overview

- Git
- GitHub
- SSH keys (time permitting)
- Markdown (barely)

### What is it?

Git is a version control system (VCS) created by Linus Torvalds in 2005. \
A VCS is a kind of "meta-save" that allows for storing the history of a software project. They are primarily used for organization and collaboration.

Git is unique from previous VCS as it is decentralized. \
The server/client dynamic is far less rigid (local/remote).

A software project with its git history and source code is referred to as a repository (repo).
- `.git` folder - "bare" repo
- The source code - working repo

GitHub is one example of where git repositories live. \
It was founded in 2008 by Tom Preston-Werner, Chris Wanstrath, P. J. Hyett and Scott Chacon, and was acquired by Microsoft in 2018. \
It's not the only git forge, but it is the most popular despite being proprietary.

**Alternatives include:**
- GitLab
- Gitea
- Codeberg
- Sourcehut
- None (wait until the end)

### Why do I care?

- Rollback
- Collaboration
- Forking
  - Soft Fork (pull requests)
  - Hard Fork

### How do I install it?

Install it via your package management system of choice. \
It ***is*** in your package management system, whether `apt`, `pacman`, `brew`, `winget`, etc.

For up-to-date install instructions, refer to [git-scm.com](https://git-scm.com/downloads)

## Git Usage

First, run `git help` \
From then on `git status` and `git log` will be your best friends.

### Pre-config

```sh
NAME="Your Name"
EMAIL="you@example.com"

git config --global init.defaultBranch main
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
```

### Creating a project

```sh
git init my-project

cd my-project
ls -la
ls -la .git
git status
git log

echo "# My Awesome Project" >> README.md
git status
git log

git add README.md # aka "staging" README.md to be committed
git status

git commit -m "Initial Commit"
git log
git status
```

```sh
echo "This is the repo for my super awesome project" >> README.md
cat README.md
git status
git diff # difference between latest commit and unstaged changes
git add README.md

echo "It supports both foo and bar" >> README.md
cat README.md
git status
# git restore --staged README.md # to unstage, will not modify the file
# git restore README.md          # to discard changes in working directory, modifies the file
# git add README.md              # to update what will be committed

git restore --staged README.md # unstage
git status

git add README.md              # stage
git status

git commit -m "Add project description"
git log
```

```sh
git rm README.md
git status
git commit -m "Remove README"
git log
```

```sh
git revert HEAD

git log
git log -p
git log -p -n 1

git remote -v # outputs nothing
```

### Pushing to GitHub

Create a new repo on Github: [github.com/new](https://github.com/new) \
Fill out the form and click "Create repository" \
Click the "SSH" button

```sh
git remote add origin "git@github.com:${USERNAME}/my-project.git"
git branch -M main
git push -u origin main

git remote -v
```

### A Fresh Start

```sh
cd ..
rm -rf my-project/

git clone "git@github.com:${USERNAME}/my-project.git"
cd my-project
```

### Push and Pull

```sh
# Pull changes from remote
git fetch origin
git merge origin
git pull origin main # equiv. to `git fetch && git merge origin`

# Push changes to remote
echo "Hello" > hello.txt
git add hello.txt
git commit
git push
```

### Checkout and Branching

Git has a feature called branching, which is used to "split the timeline" so to speak.

To see a previous commit temporarily, use `git checkout`. \
Git instructs us that we can use this to create a new branch if we want.

```sh
git checkout "$COMMIT_ID" # detached HEAD state
git switch -

git checkout "$COMMIT_ID" # detached HEAD state
git switch -c old-branch

git switch main
git branch -d old-branch # delete old-branch
```

We can also checkout branches

```sh
git checkout jeff-branch # error: pathspec...
git branch

git branch jeff-branch
git checkout jeff-branch # or `git switch jeff-branch`
git branch

git checkout -b jeff-branch # equiv. to `git branch jeff-branch && git checkout jeff-branch`
git switch -c jeff-branch   # equiv. to `git checkout -b jeff-branch`

git branch matt-branch
git branch
```

We'll populate each branch and then merge them.

```sh
git switch jeff-branch
echo "Hello, Jeff!" > hello.txt
git status
git add hello.txt
git commit

git switch matt-branch
echo "Hello, Matt!" > hello.txt
git status
git add hello.txt
git commit

git merge jeff-branch
```

### Conflict

```
Auto-merging hello.txt
CONFLICT (content): Merge conflict in hello.txt
Automatic merge failed fix conflicts and then commit the result
```

```sh
grep -rl "======="
grep -r "=======" -C 5
cat hello.txt
# Resolve the merge conflict in your text editor of choice
```

```
<<<<<<< HEAD
Hello, Matt!
=======
Hello, Jeff!
>>>>>>> jeff-branch
```

```sh
git status
git add hello.txt
git commit

git switch main
git merge matt-branch
```

### Final Push

```sh
git push -u origin --all
```

### Misc Thoughts

- Commit Messages: Imperative Mood
  - "Add" instead of "Adding"
  - "If applied, this commit will $COMMIT_MESSAGE"
  - [How to Write a Commit Message - cbeams](https://cbea.ms/git-commit/)
  - [Conventional Commits](https://www.conventionalcommits.org/)
- Merging and Maintainership
  - Forking and Pull/Merge Requests (GitHub Flow)
  - Submitting patches to Mailing Lists
  - [Git email flow vs Github flow](https://blog.brixit.nl/git-email-flow-versus-github-flow/)
- Git Features
  - `.gitignore`
  - `squash`, `reflog`, `bisect`
  - Advanced Cloning

```sh
# Renamed repo
git clone https://github.com/acm-ndsu/GitHub-Workshop GitHub-Workshop-but-cooler

# Bare repo
git clone --bare https://github.com/torvalds/linux linux.git # Large!

# Shallow Clones
git clone https://github.com/torvalds/linux --depth 2
git clone https://github.com/git/git --depth 2
git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git --depth 2
git fetch --unshallow # From https://stackoverflow.com/a/17937889
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch origin

# Local Clone
git clone ./my-project ./my-project-clone
git remote -v
```

### Recap

- Git is a version control system
- GitHub is a place where git repos live
- Git can be used independently of GitHub

```sh
git status
git log
git diff

git init
git clone

git add
git commit

git restore
git revert
git rm

git pull
git push
git merge

git branch
git checkout
git switch
```

## GitHub Usage

### Features

GitHub Features:
- Issues
- Releases
- Pull Requests (aka Merge Requests)
- CI/CD

### SSH keys

[Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```sh
EMAIL="you@example.com" # Should match your GitHub account

ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)" # Start the SSH agent

ssh-add "$HOME/.ssh/id_ed25519"

clear
cat "$HOME/.ssh/id_ed25519.pub" # Copy this output
```

GitHub > Settings > Access: SSH and GPG keys > New SSH key \
Title: `<Describe the computer>` \
Key:   `<The contents of the .pub file>`

```sh
ssh -T git@github.com
# Hi $USER! You've successfully authenticated, but GitHub does not provide shell access.
```