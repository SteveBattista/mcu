# How to Contribute via Fork and Pull Request

Follow these steps to propose changes to this repository.

## 1. Fork the repository

- [ ] Open the repository page on GitHub.
- [ ] Click **Fork** in the top-right and select your account.
- [ ] Wait for GitHub to create `<your-username>/<repo-name>` (your fork).

## 2. Clone your fork

```bash
git clone https://github.com/<your-username>/<repo-name>.git
cd <repo-name>
```

Replace `<your-username>` and `<repo-name>` with your GitHub username and repository name.

Optional (recommended): add the original repository as `upstream`.

```bash
git remote add upstream https://github.com/<original-owner>/<repo-name>.git
```

## 3. Create a feature branch

From inside the cloned repository:

```bash
git switch main                # or: git switch <default-branch>
git pull origin main           # sync your fork's main
git switch -c feature/my-change
```

Use a descriptive branch name, for example `feature/add-logging` or `fix/issue-123`.

## 4. Make and commit your changes

- Edit/add files as needed.
- Run tests/linters if the project has them.

```bash
git status
git add .
git commit -m "Short summary of the change"
```

## 5. Push your branch to your fork

```bash
git push -u origin feature/my-change
```

Confirm the branch appears on your fork in GitHub.

## 6. Open a Pull Request

- In a browser, go to the original repository on GitHub (not your fork).
- Click **Pull requests** → **New pull request**.
- Click **compare across forks** if needed.

Set:

- Base repository: `<original-owner>/<repo-name>`
- Base branch: `main` (or the branch requested by maintainers)
- Head repository: `<your-username>/<repo-name>`
- Compare branch: `feature/my-change`

Then:

- Review the diff shown by GitHub.
- Fill in a clear title.
- Add a description explaining:
  - What you changed
  - Why you changed it
  - Any related issue numbers (for example: `Closes #123`)
- Click **Create pull request**.

## 7. Respond to review

- Watch for review comments from maintainers.
- Push additional commits to the same branch to address feedback.
- Once approved, a maintainer will merge your PR.
