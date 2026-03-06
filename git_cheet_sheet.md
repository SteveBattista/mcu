# Git Command Cheat Sheet

## Setup & Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main
git config --global color.ui auto
git config --global alias.st "status -sb"
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config -–global alias.lg "log --oneline --graph --decorate --all"
git config --list
git help <command>
```

## Creating Repositories

```bash
git init                          # Initialize a local Git repo
git clone <url>                   # Clone from remote URL
```

## Basic Snapshotting

```bash
git status                        # Show working directory status
git add <file>                    # Stage a file
git add .                         # Stage all changes
git reset <file>                  # Unstage a file
git diff                          # View unstaged differences
git diff --staged                 # View staged differences
git commit -m "Message"           # Commit staged changes
git commit -am "Message"          # Stage and commit tracked files
```

## Branching & Merging

```bash
git branch                        # List branches
git branch <name>                 # Create new branch
git switch -c <name>              # Create and switch to new branch
git switch <name>                 # Switch branches, checkout was old command
git switch -c <name>              # Create and switch to a new branch
git merge <branch>                # Merge branch into current one
git branch -d <name>              # Delete branch
git branch -D <name>              # Force delete branch
git diff <branch 1> <branch 2>     # Compares two branches
```

## Remote Repositories

```bash
git remote -v                     # Show remote URLs
git remote add origin <url>       # Add remote repo
git remote remove <name>          # Remove remote connection
git push -u origin <branch>       # Push branch and track remote
git push                          # Push changes
git pull                          # Fetch from remote and merge
git fetch                         # Download from remote, no merge
```

## Undoing Changes

```bash
git restore <file>                # Restore working copy of file
git restore --staged <file>       # Unstage file
git reset --hard HEAD             # Discard all local changes
git revert <commit>               # New commit that reverts changes
git git switch -c main
```

## History & Inspection

```bash
git log                           # Show commit history
git log --oneline                 # Condensed history
git log --graph --decorate --oneline  # Visual compact graph
git show <commit>                 # Show details of a commit
git blame <file>                  # Who changed each line and when
```

## Stash & Temporary Work

```bash
git stash                         # Save uncommitted changes
git stash list                    # List stashes
git stash apply                   # Reapply last stash (keep it)
git stash pop                     # Reapply last stash and drop it
git stash drop                    # Drop last stash
git stash show -p                 # Show changes in last stash
```

## Cleanup & Maintenance

```bash
git clean -fd                     # Remove untracked files and dirs
git gc                            # Optimize repository
git prune                         # Remove unreachable objects
```

## Git Bisect (Find the Breaking Commit)

Use `git bisect` to binary‑search history and find the commit that introduced a bug.

### Manual bisect

```bash
# 1) Start: mark bad and good committs (replace good and bad with a hash)
git bisect start
git bisect bad                # Can use HEADbisc for last item in branch
git bisect good v1.2.0        # known-good commit/tag

# Git checks out a midpoint commit
# 2) Test your code (run app/tests)

# 3) Mark result
git bisect good               # bug not present here
git bisect bad                # bug present here

# Repeat test + good/bad until Git prints the first bad commit

# 4) Exit bisect mode
git bisect reset
```

### Scripted bisect

```bash
# 1) Start bisect: specify bad and good endpoints
git bisect start
git bisect bad                # Can use HEAD~1 for last item in branch
git bisect good v1.2.0        # known-good commit/tag

# or explicitly:
# git bisect start <bad-commit> <good-commit>

# 2) Run automated bisect with your test script
git bisect run ./test-script.sh

# 3) When git reports the first bad commit, exit bisect mode
git bisect reset
```

## Tags & Releases

```bash
git tag                           # List tags
git tag <tag_name>                # Create lightweight tag
git tag -a <tag_name> -m "Message"  # Create annotated tag
git show <tag_name>               # Show tag details
git push origin <tag_name>        # Push single tag
git push origin --tags            # Push all tags
```

## Advanced Commands

```bash
git cherry-pick <commit>          # Apply commit to current branch
git rebase <branch>               # Reapply commits onto another base
git rebase -i HEAD~N              # Interactive rebase last N commits
git reflog                        # Show local reference history
```

## Team Workflow: Feature Branch + PR/MR

1. Sync `main` (or `develop`)

   ```bash
   git switch main
   git pull origin main
   ```

2. Create a feature branch

   ```bash
   git switch -c feature/<short-description>
   # e.g. feature/add-login-page, bugfix/fix-header, hotfix/urgent-crash
   ```

3. Work, commit, and push

   ```bash
   git status
   git add <files>
   git commit -m "Explain what you changed"
   git push -u origin feature/<short-description>
   ```

4. Open PR/MR in UI

   Create a Pull Request (GitHub) or Merge Request (GitLab) from
   `feature/...` into `main` or `develop` for review.

5. Keep feature branch up to date

   ```bash
   git git switch -c feature/<short-description>
   git fetch origin
   git pull origin main              # or: git merge origin/main
   # Resolve conflicts if any, then:
   git push
   ```

6. Merge and clean up (after approval)

   ```bash
   git git switch -c main
   git pull origin main
   git branch -d feature/<short-description>
   git push origin --delete feature/<short-description>
   ```

---

## GitFlow-Style Branch Names (Common Pattern)

Typical long-lived branches:

- `main` (or `master`): production-ready code
- `develop`: integration branch for the next release

Supporting prefixes:

- `feature/<name>`: new features from `develop`, merged back to `develop`
- `release/<version>`: release prep from `develop`, merged into both branches
- `hotfix/<version>`: urgent fixes from `main`, merged back into both branches

Example: start a feature (GitFlow convention)

```bash
git switch develop
git pull origin develop
git switch -c feature/user-authentication
```

Example: hotfix off main

```bash
git switch main
git pull origin main
git switch -c hotfix/1.0.1
# fix, commit, test...
git push -u origin hotfix/1.0.1
# open PR/MR into main, then merge/cherry-pick into develop if needed
```
