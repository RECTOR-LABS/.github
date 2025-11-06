#!/bin/bash

# 01-setup-org-profile.sh
# Creates .github repository and organization profile README

set -e  # Exit on error

ORG="RECTOR-LABS"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_README="$SCRIPT_DIR/../profile/README.md"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🚀 Setting up RECTOR-LABS Organization Profile"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "❌ Error: gh CLI is not installed"
    echo "Install: brew install gh  (macOS) or see https://cli.github.com"
    exit 1
fi

# Check if authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Error: Not authenticated with GitHub"
    echo "Run: gh auth login"
    exit 1
fi

echo "✅ GitHub CLI authenticated"
echo ""

# Check if .github repo already exists
echo "🔍 Checking if .github repository exists..."
if gh repo view "$ORG/.github" &> /dev/null; then
    echo "⚠️  .github repository already exists"
    read -p "Do you want to update the profile README? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Skipping..."
        exit 0
    fi

    # Clone, update, and push
    echo "📦 Cloning .github repository..."
    TEMP_DIR=$(mktemp -d)
    gh repo clone "$ORG/.github" "$TEMP_DIR"

    echo "📝 Updating profile/README.md..."
    mkdir -p "$TEMP_DIR/profile"
    cp "$PROFILE_README" "$TEMP_DIR/profile/README.md"

    cd "$TEMP_DIR"
    git add profile/README.md
    git commit -m "feat: Update organization profile README with stunning new design" || echo "No changes to commit"
    git push origin main

    cd -
    rm -rf "$TEMP_DIR"

    echo "✅ Organization profile README updated!"
else
    echo "📦 Creating .github repository..."

    # Create repository
    gh repo create "$ORG/.github" \
        --public \
        --description "Organization profile and community health files for RECTOR-LABS" \
        --clone

    cd ".github"

    # Create profile directory and README
    echo "📝 Creating profile/README.md..."
    mkdir -p profile
    cp "$PROFILE_README" profile/README.md

    # Commit and push
    git add profile/README.md
    git commit -m "feat: Add stunning organization profile README

- Mission statement and values
- Featured projects showcase
- Tech stack breakdown
- Hackathon track record
- Islamic principles integrated
- Professional branding and badges"

    git push origin main

    cd ..
    rm -rf ".github"

    echo "✅ .github repository created with profile README!"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 SUCCESS! Organization profile is now live!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "👀 View it at: https://github.com/$ORG"
echo ""
