#!/usr/bin/env bash
# ──────────────────────────────────────────────────────────────────────────────
# publish-to-github.sh
# Initialises a local git repo and pushes all assessment deliverables to GitHub.
#
# USAGE:
#   1. Place all deliverable files in the same directory as this script
#   2. Set your GitHub username below (or pass as env var)
#   3. Create an empty GitHub repo named:  iso27001-nextcloud-gap-assessment
#      (go to github.com/new — do NOT initialise with README)
#   4. Run:  bash publish-to-github.sh
# ──────────────────────────────────────────────────────────────────────────────

GITHUB_USER="${GITHUB_USER:-ShoanKJ}"
REPO_NAME="iso27001-nextcloud-gap-assessment"
REMOTE="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo "▶ Initialising git repository..."
git init
git checkout -b main

echo "▶ Staging all deliverables..."
git add README.md
git add organisation-context.md
git add assessment-report.md
git add risk-register.csv
git add nextcloud-iso27001-risk-register.xlsx

echo "▶ Creating initial commit..."
git commit -m "feat: ISO 27001:2022 gap assessment — Nextcloud Server

Complete gap assessment of nextcloud/server against all 93 ISO 27001:2022
Annex A controls.

Deliverables:
- organisation-context.md  : Clause 4 context writeup
- assessment-report.md     : Full report with exec summary, control table, roadmap
- risk-register.csv        : 13 non-conformities (machine-readable)
- nextcloud-iso27001-risk-register.xlsx : Full Excel workbook (3 sheets)

Results: 10 Implemented | 38 Partial | 29 Not Implemented | 16 N/A
Non-conformities: 1 Critical | 8 High | 4 Medium
NIST CSF mapped: Identify(4) Protect(5) Respond(1) Recover(3)"

echo "▶ Adding remote origin..."
git remote add origin "$REMOTE"

echo "▶ Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Done! View your repository at:"
echo "   https://github.com/${GITHUB_USER}/${REPO_NAME}"
