#!/bin/bash

# 03-update-readmes.sh
# Updates README files for top 6 pinned repositories

set -e  # Exit on error

ORG="RECTOR-LABS"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
READMES_DIR="$SCRIPT_DIR/../readmes"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📖 Updating README Files for Top 6 Repositories"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Function to update README
update_readme() {
    local repo_name="$1"
    local readme_file="$2"
    local branch="${3:-main}"  # Default to main branch

    echo "📝 Updating README for $repo_name..."

    # Check if README file exists
    if [ ! -f "$readme_file" ]; then
        echo "  ❌ README file not found: $readme_file"
        return 1
    fi

    # Create temp directory
    TEMP_DIR=$(mktemp -d)

    # Clone repository
    echo "  📦 Cloning repository..."
    if ! gh repo clone "$ORG/$repo_name" "$TEMP_DIR/$repo_name" 2>/dev/null; then
        echo "  ❌ Failed to clone repository"
        rm -rf "$TEMP_DIR"
        return 1
    fi

    cd "$TEMP_DIR/$repo_name"

    # Check out correct branch
    if git show-ref --verify --quiet "refs/heads/$branch"; then
        git checkout "$branch"
    else
        # Try to find default branch
        default_branch=$(git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')
        git checkout "$default_branch"
    fi

    # Copy new README
    echo "  ✏️  Replacing README.md..."
    cp "$readme_file" README.md

    # Check if there are changes
    if git diff --quiet README.md; then
        echo "  ℹ️  No changes needed"
        cd - >/dev/null
        rm -rf "$TEMP_DIR"
        return 0
    fi

    # Commit and push
    echo "  💾 Committing changes..."
    git add README.md
    git commit -m "docs: Update README with comprehensive documentation

- Enhanced project overview and features
- Detailed tech stack breakdown
- Installation and usage guides
- Hackathon context and achievements
- Professional formatting with badges
- Islamic values integrated naturally
- Built with Ihsan (excellence) by RECTOR LABS"

    echo "  🚀 Pushing to GitHub..."
    git push origin HEAD

    cd - >/dev/null
    rm -rf "$TEMP_DIR"

    echo "  ✅ README updated successfully!"
}

# Update READMEs for top 6 repos

echo ""
echo "━━━ 1/6: core ━━━"
update_readme "core" "$READMES_DIR/1-CORE-README.md" "main"

echo ""
echo "━━━ 2/6: mevrebels-protocol ━━━"
update_readme "mevrebels-protocol" "$READMES_DIR/2-MEVREBELS-PROTOCOL-README.md" "main"

echo ""
echo "━━━ 3/6: web3-deal-discovery-nft-coupons ━━━"
update_readme "web3-deal-discovery-nft-coupons" "$READMES_DIR/3-WEB3-DEAL-DISCOVERY-README.md" "main"

echo ""
echo "━━━ 4/6: openbudget-id ━━━"
update_readme "openbudget-id" "$READMES_DIR/4-OPENBUDGET-ID-README.md" "main"

echo ""
echo "━━━ 5/6: asi-agents-track ━━━"
update_readme "asi-agents-track" "$READMES_DIR/5-ASI-AGENTS-TRACK-README.md" "main"

echo ""
echo "━━━ 6/6: recMEV-installer ━━━"
update_readme "recMEV-installer" "$READMES_DIR/6-RECMEV-INSTALLER-README.md" "main"

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ All README files updated!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "🔗 View your repositories:"
echo "   https://github.com/$ORG"
echo ""
