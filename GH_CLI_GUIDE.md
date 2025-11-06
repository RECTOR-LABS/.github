# 🤖 GitHub CLI Automated Revamp Guide

**Bismillah! Automate the entire RECTOR-LABS revamp with gh CLI scripts.**

---

## 🎯 Overview

Instead of manually clicking through GitHub's web UI, these scripts automate the entire revamp using the `gh` CLI tool. **Much faster, more reliable, and fully scriptable.**

**Estimated Time:**
- **With README updates:** 10-15 minutes
- **Without README updates:** 5 minutes

---

## 📋 Prerequisites

### 1. Install GitHub CLI

**macOS:**
```bash
brew install gh
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install gh
```

**Linux (RHEL/CentOS):**
```bash
sudo yum install gh
```

**Other platforms:** https://cli.github.com/

---

### 2. Install jq (JSON processor)

**macOS:**
```bash
brew install jq
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install jq
```

**Linux (RHEL/CentOS):**
```bash
sudo yum install jq
```

---

### 3. Authenticate with GitHub

```bash
gh auth login
```

Follow the prompts:
1. Choose **GitHub.com**
2. Choose **HTTPS**
3. Choose **Login with a web browser**
4. Copy the one-time code
5. Press Enter to open browser
6. Paste code and authorize

**Verify authentication:**
```bash
gh auth status
```

Should show: ✓ Logged in to github.com as [your-username]

---

## 🚀 Quick Start (Automated)

### Option 1: Full Automated Revamp (Recommended)

**Run everything in one command:**

```bash
cd /Users/rz/local-dev/core/github-revamp/scripts
./revamp.sh
```

**This will:**
1. ✅ Create organization profile README
2. ✅ Update all repository descriptions
3. ✅ Add GitHub topics to all repos
4. ✅ Update README files for top 6 repos
5. ✅ Guide you through final manual steps

**Time:** ~10-15 minutes

---

### Option 2: Fast Revamp (Skip READMEs)

**If you want speed and will update READMEs later:**

```bash
cd /Users/rz/local-dev/core/github-revamp/scripts
./revamp.sh --skip-readmes
```

**Time:** ~5 minutes

---

### Option 3: Dry Run (Test First)

**See what would happen without making changes:**

```bash
cd /Users/rz/local-dev/core/github-revamp/scripts
./revamp.sh --dry-run
```

**Time:** ~1 minute

---

## 📝 Step-by-Step Manual Execution

If you prefer to run scripts individually:

### Step 1: Organization Profile

**Creates .github repo with stunning profile README**

```bash
cd /Users/rz/local-dev/core/github-revamp/scripts
./01-setup-org-profile.sh
```

**What it does:**
- Creates `.github` repository in RECTOR-LABS
- Adds `profile/README.md` with your stunning profile
- Commits and pushes to GitHub

**Time:** ~2 minutes

**Verify:** Visit https://github.com/RECTOR-LABS (should see profile README)

---

### Step 2: Repository Descriptions & Topics

**Updates descriptions and topics for all 12 repos**

```bash
./02-update-descriptions.sh
```

**What it does:**
- Updates description for each repository
- Adds homepage URL where applicable (core → rectorspace.com)
- Adds GitHub topics for discoverability

**Time:** ~2 minutes

**Verify:** Check any repo, should see new description and topics at bottom

---

### Step 3: Update README Files (Optional but Recommended)

**Replaces READMEs with custom versions for top 6 repos**

```bash
./03-update-readmes.sh
```

**What it does:**
- Clones each repository
- Replaces README.md with custom version
- Commits with descriptive message
- Pushes back to GitHub

**Repos updated:**
1. core
2. mevrebels-protocol
3. web3-deal-discovery-nft-coupons
4. openbudget-id
5. asi-agents-track
6. recMEV-installer

**Time:** ~5-10 minutes (cloning takes time)

**Verify:** Open any updated repo, README should be comprehensive and professional

---

### Step 4: Final Manual Steps

**Guides you through settings gh CLI can't automate**

```bash
./04-finalize.sh
```

**What it does:**
- Shows you how to update organization bio
- Shows you how to pin repositories
- Verification checklist
- Next steps guidance

**Time:** ~3-5 minutes

---

## 🛠️ Individual Scripts Reference

### 01-setup-org-profile.sh

**Purpose:** Create organization profile homepage

**Features:**
- Checks if `.github` repo exists (won't duplicate)
- Creates repo with proper settings
- Adds profile README
- Safe to run multiple times (idempotent)

**Usage:**
```bash
./01-setup-org-profile.sh
```

---

### 02-update-descriptions.sh

**Purpose:** Update all repository metadata

**Updates 12 repositories:**
- core, mevrebels-protocol, web3-deal-discovery-nft-coupons
- ojk-ekraf-hackathon, openbudget-id, sanctum-gateway-track
- garuda-spark-blockchain, asi-agents-track, nosana-agents-102
- recMEV-installer, recMEV-backend-installer, recSOL

**For each repo:**
- New compelling description
- Homepage URL (if applicable)
- 8-10 relevant GitHub topics

**Usage:**
```bash
./02-update-descriptions.sh
```

**Safe to re-run:** Yes, will just update to latest descriptions

---

### 03-update-readmes.sh

**Purpose:** Replace README files with custom versions

**Updates 6 repositories:**
- core (Rails 8 platform)
- mevrebels-protocol (MEV innovation)
- web3-deal-discovery-nft-coupons (NFT coupons)
- openbudget-id (Civic tech)
- asi-agents-track (Multi-agent AI)
- recMEV-installer (Infrastructure tool)

**Process for each:**
1. Clone repository to temp directory
2. Check out main/default branch
3. Replace README.md
4. Commit with detailed message
5. Push to GitHub
6. Clean up temp directory

**Usage:**
```bash
./03-update-readmes.sh
```

**Warning:** This modifies repository content. Commits will be in your name.

**Safe to re-run:** Yes, but will create new commits if content differs

---

### 04-finalize.sh

**Purpose:** Interactive guide for manual steps

**Covers:**
1. Update organization bio (gh CLI can't do this)
2. Pin 6 repositories in correct order
3. Verify everything looks good
4. Mobile check
5. Next steps guidance

**Usage:**
```bash
./04-finalize.sh
```

**Interactive:** Will pause for you to complete each step

---

### revamp.sh (Master Script)

**Purpose:** Run all scripts in correct order with checks

**Features:**
- Prerequisites validation (gh, jq, auth)
- Confirmation before proceeding
- Progress indicators
- Error handling
- Skip options
- Dry run mode

**Usage:**
```bash
# Full automated revamp
./revamp.sh

# Skip README updates (faster)
./revamp.sh --skip-readmes

# Test without making changes
./revamp.sh --dry-run

# Show help
./revamp.sh --help
```

---

## 🐛 Troubleshooting

### Issue: "gh: command not found"

**Solution:**
```bash
# macOS
brew install gh

# Linux
sudo apt install gh  # Ubuntu/Debian
sudo yum install gh  # RHEL/CentOS
```

---

### Issue: "gh auth status" fails

**Solution:**
```bash
gh auth login
# Follow prompts to authenticate
```

---

### Issue: "jq: command not found"

**Solution:**
```bash
# macOS
brew install jq

# Linux
sudo apt install jq  # Ubuntu/Debian
sudo yum install jq  # RHEL/CentOS
```

**Workaround:** Run with `--skip-topics` if you want to skip topics temporarily

---

### Issue: "permission denied" when running scripts

**Solution:**
```bash
chmod +x *.sh
```

---

### Issue: Script fails with "repository not found"

**Possible causes:**
1. Not a member of RECTOR-LABS organization
2. Repository doesn't exist
3. Wrong organization name

**Solution:**
- Verify you're admin of RECTOR-LABS
- Check organization name is correct (case-sensitive)
- Verify repository exists

---

### Issue: README update fails for a specific repo

**Possible causes:**
1. Repository has no main branch (uses master or different default)
2. Branch is protected
3. Repository is archived

**Solution:**
- Check default branch name in repository
- Temporarily disable branch protection
- Unarchive repository if needed

**Manual fallback:**
```bash
# Clone the repo manually
gh repo clone RECTOR-LABS/[repo-name]
cd [repo-name]

# Copy README
cp /path/to/github-revamp/readmes/X-REPO-README.md README.md

# Commit and push
git add README.md
git commit -m "docs: Update README"
git push origin main
```

---

### Issue: Topics not updating

**Cause:** jq not installed or API rate limit

**Solution:**
1. Install jq: `brew install jq` or `apt install jq`
2. Check rate limit: `gh api rate_limit`
3. Wait if rate limited (resets every hour)

---

### Issue: Organization bio not updating

**Expected:** This is normal! gh CLI doesn't support org bio updates.

**Solution:** Follow manual steps in `04-finalize.sh`:
1. Go to https://github.com/organizations/RECTOR-LABS/settings/profile
2. Update bio manually
3. Click "Update profile"

---

## 📊 What Gets Updated

### Automated (via gh CLI)

✅ **Organization Profile:**
- Creates `.github` repository
- Adds `profile/README.md` (stunning homepage)

✅ **Repository Descriptions:**
- 12 repositories get new compelling descriptions
- Homepage URLs added where applicable

✅ **GitHub Topics:**
- 8-10 relevant topics per repository
- Improves discoverability in GitHub search

✅ **README Files:**
- Top 6 repositories get custom READMEs (300-450 lines each)
- Detailed documentation, installation guides, features

---

### Manual (gh CLI limitations)

⚠️ **Organization Bio:**
- Must update via web UI
- New bio: "Building for Eternity | Solana & Web3 Innovation from Indonesia 🇮🇩"

⚠️ **Repository Pinning:**
- Must pin via web UI
- Pin these 6: core, mevrebels-protocol, web3-deal-discovery, openbudget-id, asi-agents-track, recMEV-installer

---

## ⏱️ Time Breakdown

| Step | Time | Can Skip? |
|------|------|-----------|
| Prerequisites (install gh, jq, auth) | 5 min | No |
| 01-setup-org-profile.sh | 2 min | No |
| 02-update-descriptions.sh | 2 min | No |
| 03-update-readmes.sh | 5-10 min | Yes |
| 04-finalize.sh (manual) | 3-5 min | No |
| **Total (with READMEs)** | **15-20 min** | - |
| **Total (skip READMEs)** | **10 min** | - |

---

## 🎯 Recommended Workflow

**Day 1 (Quick Impact - 10 min):**
```bash
./revamp.sh --skip-readmes
```
- Organization profile: ✅
- Descriptions & topics: ✅
- Manual steps: ✅
- READMEs: Later

**Result:** 80% visual impact achieved

---

**Day 2 (Complete - 10 min):**
```bash
./03-update-readmes.sh
```
- Update READMEs for top 6 repos: ✅

**Result:** 100% revamp complete

---

## 🔐 Safety Features

**All scripts include:**
- ✅ **Idempotent** - Safe to run multiple times
- ✅ **Error handling** - Exits on failures
- ✅ **Confirmations** - Asks before destructive actions
- ✅ **Dry run mode** - Test without changes
- ✅ **Verbose output** - See what's happening
- ✅ **Rollback friendly** - Git makes everything reversible

**If something goes wrong:**
- All changes are committed to git
- You can revert any commit
- You can re-run scripts to fix

---

## 🚀 Next Steps After Completion

### 1. Verify Everything

```bash
# Check organization page
open https://github.com/RECTOR-LABS

# Check a few individual repos
open https://github.com/RECTOR-LABS/core
open https://github.com/RECTOR-LABS/mevrebels-protocol
```

### 2. Share the News

**Social Media:**
- Twitter/X thread showcasing new organization
- LinkedIn post
- Dev.to article about the revamp

**Communities:**
- Share in Solana Discord
- Post in Indonesia tech groups
- Superteam network

### 3. Cross-Promote

- Link from rectorspace.com
- Add to personal GitHub profile
- Include in hackathon submissions

---

## 📞 Support

**Issues with scripts?**
- Check troubleshooting section above
- Run with `--dry-run` to test
- Open issue in `core` repository

**Want to customize?**
- All scripts are in `github-revamp/scripts/`
- Edit descriptions in `02-update-descriptions.sh`
- Modify README templates in `github-revamp/readmes/`

---

## 🙏 Benefits of gh CLI Approach

**vs Manual Web UI:**

| Feature | gh CLI | Web UI |
|---------|--------|--------|
| Speed | ⚡ 10-15 min | 🐌 2-3 hours |
| Consistency | ✅ Scripts ensure uniformity | ❌ Human error prone |
| Repeatability | ✅ Re-run anytime | ❌ Click again |
| Automation | ✅ Full automation | ❌ Manual only |
| Documentation | ✅ Scripts = docs | ❌ Hard to document |
| Rollback | ✅ Git history | ⚠️ Manual undo |
| Team Scale | ✅ Share scripts | ❌ Share screenshots |

---

<div align="center">

**Built with Bismillah** 🕌

Ready to automate? Run:

```bash
cd github-revamp/scripts
./revamp.sh
```

May Allah make this easy. Aamiin.

---

**RECTOR LABS** | Building for Eternity | 2025

</div>
