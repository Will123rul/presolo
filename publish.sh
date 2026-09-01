#!/usr/bin/env bash
# Publish this folder to GitHub Pages. Safe to re-run: it skips whatever is
# already done and just pushes any new commits.
set -euo pipefail
cd "$(dirname "$0")"

REPO_NAME="presolo"
DESC="Student pilot study tools: pre-solo study deck, quiz game, and Private Pilot written test prep"

say() { printf '\n\033[1m%s\033[0m\n' "$*"; }

# ── 1. Log in ─────────────────────────────────────────────────────────────
if gh auth status >/dev/null 2>&1; then
  say "[1/4] Already logged in to GitHub."
else
  say "[1/4] Logging in to GitHub."
  echo "A browser will open. Copy the one-time code shown here and paste it there."
  gh auth login --hostname github.com --git-protocol https --web
fi

gh auth setup-git >/dev/null 2>&1 || true
USER=$(gh api user --jq .login)
echo "Signed in as: $USER"

# ── 2. Create the repository ──────────────────────────────────────────────
if gh repo view "$USER/$REPO_NAME" >/dev/null 2>&1; then
  say "[2/4] Repository $USER/$REPO_NAME already exists."
  if ! git remote get-url origin >/dev/null 2>&1; then
    git remote add origin "https://github.com/$USER/$REPO_NAME.git"
  fi
else
  say "[2/4] Creating public repository $USER/$REPO_NAME."
  gh repo create "$REPO_NAME" --public --description "$DESC" --source=. --remote=origin
fi

# ── 3. Push ───────────────────────────────────────────────────────────────
say "[3/4] Pushing commits."
git push -u origin main

# ── 4. Turn on GitHub Pages ───────────────────────────────────────────────
say "[4/4] Enabling GitHub Pages."
if gh api "repos/$USER/$REPO_NAME/pages" >/dev/null 2>&1; then
  echo "Pages was already enabled."
else
  printf '{"source":{"branch":"main","path":"/"}}' \
    | gh api -X POST "repos/$USER/$REPO_NAME/pages" --input - >/dev/null \
    && echo "Pages enabled." \
    || echo "Could not enable Pages automatically — turn it on at:
  https://github.com/$USER/$REPO_NAME/settings/pages
  (Source: Deploy from a branch → main → / (root))"
fi

cat <<EOF

────────────────────────────────────────────────────────────
  Done.

  Your site:  https://$USER.github.io/$REPO_NAME
  Repository: https://github.com/$USER/$REPO_NAME

  The first build takes 1-3 minutes. If you get a 404,
  wait a moment and refresh.

  Pages:
    /                landing page
    /study.html      pre-solo study deck
    /quiz.html       quiz game
    /written.html    Private Pilot written test prep
    /equipment.html  A TOMATO FLAMES / FLAPS drill
────────────────────────────────────────────────────────────
EOF
