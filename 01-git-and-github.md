---
title: Git and GitHub
author: UND Association for Computing Machinery
institute: https://linktr.ee/UND_ACM
date: \today
theme: Warsaw
colortheme: spruce
fontsize: 12pt
aspectratio: 169
header-includes: |
    \usepackage{hyperref}
    \hypersetup{colorlinks=true,urlcolor=blue}

---

# What is Git?

## Git

Git is a version control system (VCS) created by Linus Torvalds in 2005.

A VCS is a kind of "meta-save" that allows for storing the history of a software project.

They are primarily used for organization and collaboration.

---

## Git Repositories

A software project with its git history and source code is referred to as a repository (repo).

- `.git` directory  (stores history)
- working directory (the plaintext source code)

## Decentralization

Git is unique from previous VCS as it is decentralized.

The server/client dynamic is far less rigid (local/remote).

\pagebreak

# What is GitHub?

## GitHub

GitHub is one example of where git repositories live.

It was founded in 2008 by

- Tom Preston-Werner
- Chris Wanstrath
- P. J. Hyett
- Scott Chacon

GitHub was acquired by Microsoft in 2018.

# GitHub Alternatives

GitHub is not the only git forge, but it is the most popular despite being proprietary.

## Alternatives

- GitLab
- Gitea
- Codeberg
- Sourcehut
- None (wait until the end)

\pagebreak

# Why should I care?

## Rollback

Reverting commits

## Collaboration

- Merging branches
- Merging with upstream/remote

## Forking

Fork: Git(Hub) term for a copy (of the source code).

As in a "fork in the road"

- Soft Fork (pull requests)
- Hard Fork

\pagebreak

# How do I install it?

## Installation

Install it via your package management system of choice.

It ***is*** in your package management system, whether it's `apt`, `pacman`, `brew`, `winget`, etc.

For up-to-date install instructions, refer to [git-scm.com/downloads](https://git-scm.com/downloads)

# Git Usage

## Basic Usage

First, run `git help` \
From then on `git status` and `git log` will be your best friends.

# Pre-configuration

```sh
NAME="Your Name"
EMAIL="you@example.com"

git config --global init.defaultBranch main
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"
```

# Creating a project

```sh
git init my-project

cd my-project
ls -la
ls -la .git
git status
git log
```

# First Commit

```sh
echo "# My Awesome Project" >> README.md
git status
git log

git add README.md # aka "staging" README.md
git status

git commit -m "Initial Commit"
git log
git status
```

# Second Commit

```sh
echo "Description of my awesome project" >> README.md
cat README.md
git status
git diff
```

---

```sh
git add README.md
echo "It supports both foo and bar" >> README.md
cat README.md
git status
```

---

```sh
# git restore --staged README.md # unstage
# git restore README.md          # discard
# git add README.md              # update
```

---

```sh
git restore --staged README.md # unstage
git status

git add README.md              # stage
git status

git diff
git diff --staged

git commit -m "Add project description"
git log
```

# Third Commit

```sh
git rm README.md
git status
git commit -m "Remove README"
git log
```

# Reverting the Third Commit

```sh
git log
git revert --no-commit HEAD
git status
git log
git revert --continue
```

\pagebreak

# Viewing our Commits

```sh
git log
git log -p
git log -p -n 1

git remote -v # outputs nothing
```

# Pushing to GitHub

Create a new repo on GitHub: [github.com/new](https://github.com/new)

Fill out the form and click "Create repository"

Click the "SSH" button

```sh
git remote add origin "git@github.com:${USERNAME}/my-project.git"
git branch -M main
git push -u origin main

git remote -v
```

\pagebreak

# A Fresh Start

```sh
cd ..
rm -rf my-project/

git clone "git@github.com:${USERNAME}/my-project.git"
cd my-project
```

# Push and Pull

```sh
# Pull changes from remote
git fetch --all
git merge origin
# git pull  # equiv. to `git fetch && git merge`

# Push changes to remote
echo "Hello" > hello.txt
git add hello.txt
git commit
git push
```

\pagebreak

# Checkout and Branching

## Checkout

Git allows users to temporarily view a previous commit by using `git checkout` and the commit id.

## Branching

Git also has a feature called branching, which is used to "split the timeline" so to speak.

---

## Checkout Commits

Notice that after checking out a commit, Git informs us we can create a new branch at this commit.

We may wish to do this to build new features on a known-working previous commit, rather than on main.

```sh
git checkout "$COMMIT_ID" # detached HEAD state
git switch -

git checkout "$COMMIT_ID" # detached HEAD state
git switch -c old-branch

git switch main
git branch -d old-branch # delete old-branch
```

---

## Checkout Branches

```sh
git checkout jeff-branch # error: pathspec...
git branch

git branch jeff-branch
git checkout jeff-branch # or `git switch jeff-branch`
git branch

# git checkout -b jeff-branch 
# git switch -c jeff-branch

git branch matt-branch
git branch
```

---

\pagebreak

## Populating jeff-branch

We'll populate each branch and then merge them, just as we had done earlier with `main` and `origin/main`.

```sh
git switch jeff-branch
echo "Hello, Jeff!" > hello.txt
git status
git add hello.txt
git commit
```

---

## Populating match-branch

```sh
git switch matt-branch
echo "Hello, Matt!" > hello.txt
git status
git add hello.txt
git commit

git merge jeff-branch
```

\pagebreak

# Conflict!

## Merge Conflict

```
Auto-merging hello.txt
CONFLICT (content): Merge conflict in hello.txt
Automatic merge failed fix conflicts and then commit the result
```

---

## Finding the Conflict

```sh
grep -rl "======="
grep -r  "=======" -C 5
cat hello.txt
# Resolve the merge conflict in your text editor of choice
```

## hello.txt

```
<<<<<<< HEAD
Hello, Matt!
=======
Hello, Jeff!
>>>>>>> jeff-branch
```

---

## Post-Conflict

```sh
git status
git add hello.txt
git commit

git switch main
git merge matt-branch
```

# Final Push

## Push all branches to origin (i.e. GitHub)

```sh
git push -u origin --all
```

\pagebreak

# Private Email

## GitHub Configuration (noreply emails)

GitHub > Settings > Access: Emails

Check "Keep my email address private"

Check "Block command line pushes that expose my email"

## Git Configuration (noreply emails)

```sh
EMAIL="00000000+username@users.noreply.github.com"
git config --global user.email "$EMAIL"
```

# GitHub SSH Keys

## Creating an SSH key

```sh
EMAIL="you@example.com" # Should match your GitHub account

ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)" # Start the SSH agent

ssh-add "$HOME/.ssh/id_ed25519"

clear
cat "$HOME/.ssh/id_ed25519.pub" # Copy this output
```

---

## GitHub configuration (SSH keys)

GitHub > Settings > Access: SSH and GPG keys > New SSH key

Title: `<Describe the computer>`

Key:   `<The contents of the .pub file>`

```sh
ssh -T git@github.com

# Hi $USER! You've successfully authenticated, but GitHub
# does not provide shell access.
```

See also [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) - Github Documentation

\pagebreak

# Parting Thoughts

## Commit Messages

- Commit Messages: Imperative Mood
  - "Add" instead of "Adding"
  - "If applied, this commit will $COMMIT_MESSAGE"
  - [How to Write a Commit Message - cbeams](https://cbea.ms/git-commit/)
  - [Conventional Commits](https://www.conventionalcommits.org/)

## Merging and Maintainership

- [Git email flow vs GitHub flow](https://blog.brixit.nl/git-email-flow-versus-github-flow/)
  - Forking and Pull/Merge Requests (GitHub Flow)
  - Submitting patches to Mailing Lists

---

## Git Features

- `.gitignore`
- `rebase`, `reflog`, `bisect`
- [git-scm.com/docs](https://git-scm.com/docs)

\pagebreak

# Advanced `git clone`-ing

```sh
# Renamed repo
git clone https://github.com/acm-ndsu/GitHub-Workshop \
GitHub-Workshop-but-cooler

# Bare repo
git clone --bare https://github.com/torvalds/linux linux.git

# Shallow Clones
git clone https://github.com/git/git --depth 2

# Local Clone
git clone ./my-project ./my-project-clone
cd ./my-project-clone
git remote -v
```

\pagebreak

# Recap

## What is Git and GitHub?

- Git is a version control system
- GitHub is a place where git repos live
- Git can be used independently of GitHub

---

## Git Commands - Part 1

```sh
git status
git log
git diff

git init
git clone

git add
git commit
```

---

## Git Commands - Part 2

```sh
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

---

## Git Commands with Context

```sh
git clone "$URL" # or `git init "$REPO_NAME"`
cd "$REPO_NAME"

git pull
git add "$FILE"
git status
git commit
git push

git log
```

\pagebreak

# Questions?

## Additional Resources

- [Git - Reference (git-scm.com/docs)](https://git-scm.com/docs) 
- [Git from the Bottom Up](https://jwiegley.github.io/git-from-the-bottom-up/)
