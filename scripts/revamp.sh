#!/bin/bash

# revamp.sh
# Master script to automate RECTOR-LABS GitHub organization revamp
# Usage: ./revamp.sh [--skip-readmes] [--dry-run]

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Parse arguments
SKIP_READMES=false
DRY_RUN=false

for arg in "$@"; do
    case $arg in
        --skip-readmes)
            SKIP_READMES=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --help)
            echo "Usage: ./revamp.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --skip-readmes    Skip updating README files (faster, for testing)"
            echo "  --dry-run         Show what would be done without making changes"
            echo "  --help            Show this help message"
            echo ""
            exit 0
            ;;
    esac
done

# Header
clear
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}   🚀 RECTOR-LABS GitHub Organization Revamp${NC}"
echo -e "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${GREEN}Bismillah! Let's make RECTOR-LABS stunning.${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo -e "${YELLOW}⚠️  DRY RUN MODE - No changes will be made${NC}"
    echo ""
fi

# Prerequisites check
echo -e "${BLUE}━━━ Prerequisites Check ━━━${NC}"
echo ""

# Check if gh CLI is installed
echo -n "Checking gh CLI... "
if ! command -v gh &> /dev/null; then
    echo -e "${RED}✗${NC}"
    echo ""
    echo -e "${RED}Error: gh CLI is not installed${NC}"
    echo ""
    echo "Install with:"
    echo "  macOS:  brew install gh"
    echo "  Linux:  See https://cli.github.com"
    echo ""
    exit 1
fi
echo -e "${GREEN}✓${NC}"

# Check if authenticated
echo -n "Checking authentication... "
if ! gh auth status &> /dev/null; then
    echo -e "${RED}✗${NC}"
    echo ""
    echo -e "${RED}Error: Not authenticated with GitHub${NC}"
    echo ""
    echo "Authenticate with:"
    echo "  gh auth login"
    echo ""
    exit 1
fi
echo -e "${GREEN}✓${NC}"

# Check if jq is installed (needed for topics)
echo -n "Checking jq (JSON processor)... "
if ! command -v jq &> /dev/null; then
    echo -e "${RED}✗${NC}"
    echo ""
    echo -e "${YELLOW}Warning: jq not installed (needed for topics)${NC}"
    echo ""
    echo "Install with:"
    echo "  macOS:  brew install jq"
    echo "  Linux:  apt install jq / yum install jq"
    echo ""
    read -p "Continue without topics? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}✓${NC}"
fi

echo ""
echo -e "${GREEN}✅ All prerequisites met!${NC}"
echo ""

# Confirmation
echo -e "${YELLOW}━━━ What will be done ━━━${NC}"
echo ""
echo "This script will:"
echo "  1. Create .github repository with organization profile README"
echo "  2. Update all repository descriptions (12 repos)"
echo "  3. Add GitHub topics to all repositories"
if [ "$SKIP_READMES" = false ]; then
    echo "  4. Update README files for top 6 repositories"
    echo "  5. Guide you through final manual steps"
else
    echo "  4. [SKIPPED] Update README files"
    echo "  5. Guide you through final manual steps"
fi
echo ""
echo -e "${CYAN}Estimated time: $([ "$SKIP_READMES" = false ] && echo "10-15 minutes" || echo "5 minutes")${NC}"
echo ""

if [ "$DRY_RUN" = false ]; then
    read -p "Ready to proceed? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Aborted."
        exit 0
    fi
    echo ""
fi

# Change to scripts directory
cd "$(dirname "$0")"

# Step 1: Setup organization profile
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}Step 1/4: Organization Profile${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] Would create .github repo with profile README"
else
    bash 01-setup-org-profile.sh
fi

# Step 2: Update descriptions and topics
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}Step 2/4: Repository Descriptions & Topics${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] Would update descriptions and topics for 12 repositories"
else
    bash 02-update-descriptions.sh
fi

# Step 3: Update READMEs (optional)
if [ "$SKIP_READMES" = false ]; then
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}Step 3/4: Update README Files${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${YELLOW}⚠️  This step takes ~5-10 minutes (clones, updates, pushes)${NC}"
    echo ""

    if [ "$DRY_RUN" = true ]; then
        echo "[DRY RUN] Would update READMEs for 6 repositories"
    else
        read -p "Update README files now? (y/n) " -n 1 -r
        echo ""
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            bash 03-update-readmes.sh
        else
            echo ""
            echo -e "${YELLOW}Skipping README updates. You can run this later:${NC}"
            echo "  cd github-revamp/scripts"
            echo "  bash 03-update-readmes.sh"
            echo ""
        fi
    fi
else
    echo ""
    echo -e "${YELLOW}⏭️  Skipping README updates (--skip-readmes flag)${NC}"
    echo ""
fi

# Step 4: Finalization
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${CYAN}Step 4/4: Final Manual Steps${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

if [ "$DRY_RUN" = true ]; then
    echo "[DRY RUN] Would show finalization guide"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🎉 DRY RUN COMPLETE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "No changes were made. Run without --dry-run to apply changes."
else
    bash 04-finalize.sh
fi

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✨ REVAMP COMPLETE! ✨${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
