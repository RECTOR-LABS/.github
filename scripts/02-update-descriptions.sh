#!/bin/bash

# 02-update-descriptions.sh
# Updates repository descriptions and topics for all RECTOR-LABS repos

set -e  # Exit on error

ORG="RECTOR-LABS"

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📝 Updating Repository Descriptions & Topics"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Function to update repo
update_repo() {
    local repo_name="$1"
    local description="$2"
    local homepage="$3"
    shift 3
    local topics=("$@")

    echo "🔧 Updating $repo_name..."

    # Update description and homepage
    if [ -n "$homepage" ]; then
        gh repo edit "$ORG/$repo_name" \
            --description "$description" \
            --homepage "$homepage" 2>/dev/null || echo "  ⚠️  Could not update description/homepage"
    else
        gh repo edit "$ORG/$repo_name" \
            --description "$description" 2>/dev/null || echo "  ⚠️  Could not update description"
    fi

    # Update topics (need to use API)
    if [ ${#topics[@]} -gt 0 ]; then
        topics_json=$(printf '%s\n' "${topics[@]}" | jq -R . | jq -s .)
        echo "{\"names\":$topics_json}" | gh api -X PUT "/repos/$ORG/$repo_name/topics" --input - >/dev/null 2>&1 || echo "  ⚠️  Could not update topics"
    fi

    echo "  ✅ Updated"
}

# 1. core
echo ""
echo "━━━ core ━━━"
update_repo "core" \
    "Rails 8 monolith powering rectorspace.com | Full-stack platform with 7 sections | Built in 48 hours, production-ready" \
    "https://rectorspace.com" \
    ruby rails rails8 fullstack monolith tailwindcss postgresql production rectorspace indonesia

# 2. mevrebels-protocol
echo ""
echo "━━━ mevrebels-protocol ━━━"
update_repo "mevrebels-protocol" \
    "Democratizing MEV on Solana through DAO governance | Community-owned MEV infrastructure | Superteam Cypherpunk Hackathon 2025" \
    "" \
    solana mev dao typescript blockchain defi hackathon-2025 superteam solana-program web3

# 3. web3-deal-discovery-nft-coupons
echo ""
echo "━━━ web3-deal-discovery-nft-coupons ━━━"
update_repo "web3-deal-discovery-nft-coupons" \
    "Reimagining Groupon with tradable NFT coupons on Solana | Secondary market for local deals | Coupons as liquid assets" \
    "" \
    solana nft web3 typescript blockchain ecommerce hackathon-2025 metaplex spl-token indonesia

# 4. ojk-ekraf-hackathon
echo ""
echo "━━━ ojk-ekraf-hackathon ━━━"
update_repo "ojk-ekraf-hackathon" \
    "KaryaChain: Blockchain IP rights management for creative economy | OJK-Ekraf Infinity Hackathon 2025 | Indonesia-focused" \
    "" \
    solana blockchain typescript intellectual-property creative-economy hackathon-2025 ojk ekraf indonesia web3

# 5. openbudget-id
echo ""
echo "━━━ openbudget-id ━━━"
update_repo "openbudget-id" \
    "Real-time government spending transparency on Solana | Civic tech for democratic accountability | Indonesia open governance" \
    "" \
    solana civic-tech blockchain typescript open-governance transparency hackathon-2025 indonesia web3 public-good

# 6. sanctum-gateway-track
echo ""
echo "━━━ sanctum-gateway-track ━━━"
update_repo "sanctum-gateway-track" \
    "Transaction analytics and insights for Solana developers | Real-time on-chain analytics | Sanctum Gateway Track hackathon" \
    "" \
    solana analytics blockchain typescript developer-tools sanctum hackathon-2025 solana-program web3

# 7. garuda-spark-blockchain
echo ""
echo "━━━ garuda-spark-blockchain ━━━"
update_repo "garuda-spark-blockchain" \
    "KoperasiChain: Digital cooperative platform for Indonesian MSMEs on blockchain | Garuda Spark Blockchain Hackathon 2025" \
    "" \
    solana blockchain typescript msme cooperative financial-inclusion hackathon-2025 garuda-spark indonesia web3

# 8. asi-agents-track
echo ""
echo "━━━ asi-agents-track ━━━"
update_repo "asi-agents-track" \
    "Multi-agent AI system with Fetch.ai and SingularityNET | Autonomous agent collaboration | ASI Agents Track hackathon" \
    "" \
    python ai-agents fetchai singularitynet multi-agent-system artificial-intelligence hackathon-2025 machine-learning

# 9. nosana-agents-102
echo ""
echo "━━━ nosana-agents-102 ━━━"
update_repo "nosana-agents-102" \
    "DevFlow AI: Intelligent development assistant with workflow automation | Context-aware coding suggestions | Nosana Builders Challenge 102" \
    "" \
    ai agents development-tools automation nosana hackathon-2025 developer-experience workflow

# 10. recMEV-installer
echo ""
echo "━━━ recMEV-installer ━━━"
update_repo "recMEV-installer" \
    "Automated installer for recMEV: Solana DEX pool discovery tool | Shell scripts + Rust backend | Public infrastructure" \
    "" \
    shell rust solana mev dex installer developer-tools infrastructure automation devops

# 11. recMEV-backend-installer
echo ""
echo "━━━ recMEV-backend-installer ━━━"
update_repo "recMEV-backend-installer" \
    "Rust-based DEX pool discovery for Solana | Backend installer for recMEV infrastructure | High-performance MEV tooling" \
    "" \
    rust shell solana mev dex backend installer infrastructure performance devops

# 12. recSOL
echo ""
echo "━━━ recSOL ━━━"
update_repo "recSOL" \
    "Solana metadata repository for RECTOR ecosystem | Configuration and references for Solana projects | Infrastructure" \
    "" \
    solana metadata configuration infrastructure reference documentation

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ All repository descriptions and topics updated!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
