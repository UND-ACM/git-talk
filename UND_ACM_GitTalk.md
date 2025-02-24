---
title: Git and GitHub
author: UND Association for Computing Machinery
institute: https://linktr.ee/UND_ACM
date: \today
theme: Warsaw
colortheme: spruce
fontsize: 12pt
aspectratio: 169

---

# Introduction

"I'm an egotistical bastard, and I name all my projects after myself. First Linux, now git." - Linus Torvalds, creator of Linux and git

# What is Git?

Git is a version control system (VCS) created by Linus Torvalds in 2005.

A VCS is a kind of "meta-save" that allows for storing the history of a software project.

They are primarily used for organization and collaboration.

# What is Git?

A software project with its git history and source code is referred to as a repository (repo).

- `.git` directory  (stores history)
- working directory (the plaintext source code)

Git is unique from previous VCS as it is decentralized. \
The server/client dynamic is far less rigid (local/remote).

# What is GitHub?

GitHub is one example of where git repositories live.

It was founded in 2008 by Tom Preston-Werner, Chris Wanstrath, P. J. Hyett and Scott Chacon

GitHub was acquired by Microsoft in 2018.

# GitHub Alternatives

GitHub not the only git forge, but it is the most popular despite being proprietary.

**Alternatives include:**

- GitLab
- Gitea
- Codeberg
- Sourcehut
- None (wait until the end)

# Why should I care?

- Rollback
  - Reverting commits

# Why should I care?

- Collaboration
  - Merging branches
  - Merging with upstream/remote

# Why should I care?

- Forking
  - Fork: Git(Hub) term for a copy (of the source code).
  - As in a "fork in the road"
  - Two main types
    - Soft Fork (pull requests)
    - Hard Fork

# How do I install it?

Install it via your package management system of choice.

It ***is*** in your package management system, whether it's `apt`, `pacman`, `brew`, `winget`, etc.

For up-to-date install instructions, refer to [git-scm.com/downloads](https://git-scm.com/downloads)

# Git Usage

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

# Second Commit

```sh
git add README.md
echo "It supports both foo and bar" >> README.md
cat README.md
git status
```

# Second Commit

```sh
# git restore --staged README.md # unstage
# git restore README.md          # discard
# git add README.md              # update
```

# Second Commit

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

# Checkout and Branching

Git has a feature called branching, which is used to "split the timeline" so to speak.

To see a previous commit temporarily, use `git checkout`.

Git instructs us that we can use this to create a new branch if we want.

# Checkout and Branching

```sh
git checkout "$COMMIT_ID" # detached HEAD state
git switch -

git checkout "$COMMIT_ID" # detached HEAD state
git switch -c old-branch

git switch main
git branch -d old-branch # delete old-branch
```

# Checkout and Branching

We can also checkout branches

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

# Checkout and Branching

We'll populate each branch and then merge them, just as we had done earlier with `main` and `origin/main`.

```sh
git switch jeff-branch
echo "Hello, Jeff!" > hello.txt
git status
git add hello.txt
git commit
```

# Checkout and Branching

```sh
git switch matt-branch
echo "Hello, Matt!" > hello.txt
git status
git add hello.txt
git commit

git merge jeff-branch
```

# Conflict

```
Auto-merging hello.txt
CONFLICT (content): Merge conflict in hello.txt
Automatic merge failed fix conflicts and then commit the result
```

# Conflict

```sh
grep -rl "======="
grep -r  "=======" -C 5
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

# Conflict

```sh
git status
git add hello.txt
git commit

git switch main
git merge matt-branch
```

# Final Push

```sh
git push -u origin --all
```

# GitHub noreply Emails

GitHub > Settings > Access: Emails

Check "Keep my email address private"

Check "Block command line pushes that expose my email"

```sh
EMAIL="00000000+username@users.noreply.github.com"
git config --global user.email "$EMAIL"
```

# GitHub SSH Keys

```sh
EMAIL="you@example.com" # Should match your GitHub account

ssh-keygen -t ed25519 -C "$EMAIL"
eval "$(ssh-agent -s)" # Start the SSH agent

ssh-add "$HOME/.ssh/id_ed25519"

clear
cat "$HOME/.ssh/id_ed25519.pub" # Copy this output
```

# GitHub SSH Keys

GitHub > Settings > Access: SSH and GPG keys > New SSH key

Title: `<Describe the computer>`

Key:   `<The contents of the .pub file>`

```sh
ssh -T git@github.com

# Hi $USER! You've successfully authenticated, but GitHub
# does not provide shell access.
```

See also [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) - Github Documentation

# Parting Thoughts

- Commit Messages: Imperative Mood
  - "Add" instead of "Adding"
  - "If applied, this commit will $COMMIT_MESSAGE"
  - [How to Write a Commit Message - cbeams](https://cbea.ms/git-commit/)
  - [Conventional Commits](https://www.conventionalcommits.org/)

# Parting Thoughts

- Merging and Maintainership
  - [Git email flow vs GitHub flow](https://blog.brixit.nl/git-email-flow-versus-github-flow/)
    - Forking and Pull/Merge Requests (GitHub Flow)
    - Submitting patches to Mailing Lists
	
# Parting Thoughts

- Git Features
  - `.gitignore`
  - `rebase`, `reflog`, `bisect`
  - [git-scm.com/docs](https://git-scm.com/docs)

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

# Recap

- Git is a version control system
- GitHub is a place where git repos live
- Git can be used independently of GitHub

# Recap

```sh
git status
git log
git diff

git init
git clone

git add
git commit
```

# Recap

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

# Recap - In Context

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

# Recap

For more information:

- [Git - Reference (git-scm.com/docs)](https://git-scm.com/docs) 
- [Git from the Bottom Up](https://jwiegley.github.io/git-from-the-bottom-up/)