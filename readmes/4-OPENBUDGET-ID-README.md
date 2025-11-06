<div align="center">

# 🏛️ OpenBudget ID

**Real-time government spending transparency on Solana blockchain**

[![Solana](https://img.shields.io/badge/Solana-14F195?style=for-the-badge&logo=solana&logoColor=black)](https://solana.com)
[![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)](https://typescriptlang.org)
[![Civic Tech](https://img.shields.io/badge/Civic_Tech-Public_Good-41CFFF?style=for-the-badge)](https://github.com/RECTOR-LABS/openbudget-id)

🏆 **Open Governance Hackathon** | 🇮🇩 **Indonesia-Focused** | 🕌 **Built with Amanah**

[🌐 Live Demo](#) • [📖 Docs](#) • [🏛️ RECTOR LABS](https://github.com/RECTOR-LABS)

</div>

---

## 🎯 The Problem

**Government spending is opaque and unaccountable.**

Indonesia's public finance system lacks real-time transparency:

- 💰 **Hidden Spending** - Citizens can't see where tax money goes
- 🕒 **Delayed Reports** - Budget reports published months/years late
- 📊 **No Accountability** - Difficult to track misuse or corruption
- 🚫 **Limited Access** - Data buried in PDFs, not machine-readable
- 🤝 **Trust Gap** - Citizens distrust government financial management

**Result:** Corruption, inefficiency, and broken social contract between government and people.

---

## ✨ The Solution: On-Chain Transparency

**Put Indonesia's budget on the blockchain.**

OpenBudget ID creates real-time, immutable government spending records:

- ⛓️ **On-Chain Records** - Every transaction recorded on Solana
- 📊 **Real-Time Dashboard** - See spending as it happens
- 🔍 **Searchable Data** - Query by ministry, project, amount, date
- 📈 **Visualizations** - Charts and graphs for easy understanding
- 🔔 **Citizen Alerts** - Notifications for unusual spending patterns
- 🌐 **Public API** - Open data for journalists, researchers, NGOs

**Tagline:** *"Your tax rupiah, your right to know."*

---

## 🛠️ Tech Stack

**Blockchain:**
- Solana (devnet/mainnet)
- Anchor Framework 0.29+
- SPL Token (for tracking budget allocations)

**Smart Contracts:**
- Rust + Anchor
- Budget recording contracts
- Verification and audit trails
- Multi-sig approval system

**Frontend:**
- TypeScript + React
- Next.js 14 + TailwindCSS
- Recharts (data visualization)
- Solana Web3.js

**Backend:**
- Node.js + Express
- PostgreSQL (indexed blockchain data)
- Redis (caching)
- Data pipelines for government sources

**Data Sources:**
- Indonesian Ministry of Finance API
- Public procurement portal (LKPP)
- Manual data entry (transitional)

---

## 🚀 Quick Start

### Prerequisites

```bash
- Node.js 18+
- Solana CLI 1.18+
- Anchor 0.29+
- PostgreSQL 15+
```

### Installation

```bash
# Clone
git clone https://github.com/RECTOR-LABS/openbudget-id.git
cd openbudget-id

# Install dependencies
npm install

# Environment setup
cp .env.example .env
# Add Solana RPC URL and database credentials

# Build contracts
cd programs/openbudget
anchor build
anchor deploy --provider.cluster devnet

# Database setup
cd ../../backend
npm run db:migrate
npm run db:seed

# Start services
npm run dev # Backend
cd ../frontend
npm run dev # Frontend
```

---

## 📖 How It Works

### Data Flow

```
Government Spending → Data Pipeline → Solana Smart Contract → Indexer → Dashboard
                                            ↓
                                    Immutable Record
                                            ↓
                                    Public API → Citizens/Media/NGOs
```

### Key Components

**1. Data Ingestion**
- Automated scrapers for government portals
- Manual entry interface for verified data
- Multi-sig approval before on-chain recording

**2. Smart Contracts**
- `RecordTransaction` - Store spending records
- `VerifySource` - Multi-sig verification
- `QueryRecords` - Fetch and filter data

**3. Dashboard**
- **Overview:** Total budget, spending, remaining
- **Ministries:** Breakdown by government department
- **Projects:** Track major infrastructure/programs
- **Timeline:** Historical spending patterns
- **Alerts:** Flag unusual transactions

**4. Public API**
- RESTful endpoints for data access
- GraphQL for complex queries
- Export formats: JSON, CSV, Excel

---

## 🎨 Key Features

### For Citizens
- 🔍 **Search Spending** - By ministry, project, amount, date
- 📊 **Visualizations** - Interactive charts and timelines
- 🔔 **Watchlists** - Get alerts on tracked projects
- 📱 **Mobile-Friendly** - Access from any device
- 🌐 **Bahasa Indonesia** - Fully localized

### For Journalists/Researchers
- 📈 **Data Export** - Download datasets for analysis
- 🔗 **Citation Links** - Permanent URLs to records
- 📊 **Trend Analysis** - Historical patterns and anomalies
- 🤖 **API Access** - Programmatic data retrieval

### For Government (Adoption Path)
- 🛡️ **Accountability** - Build public trust
- 📉 **Efficiency** - Identify wasteful spending
- 🌟 **Transparency** - Demonstrate good governance
- 🔐 **Immutability** - Tamper-proof records

---

## 🏆 Hackathon Context

**Competition:** Open Governance Hackathon 2025
**Track:** Civic Tech
**Focus:** Government transparency for Indonesia

### Challenge Prompt

> Build tools that increase government accountability and citizen participation in Indonesia.

### Our Approach

**Why blockchain for budgets:**
1. **Immutability** - Records can't be altered or deleted
2. **Transparency** - Public ledger, anyone can verify
3. **Real-time** - No delays, immediate visibility
4. **Decentralized** - No single point of control
5. **Trust** - Cryptographic proof, not promises

**Indonesia Context:**
- 270M population, massive tax base
- History of corruption in public spending
- Growing tech-savvy population
- Government digitalization initiatives (SPBE)

**Islamic Principles Applied:**
- **Amanah (Trust):** Government as trustee of public funds
- **Adl (Justice):** Equal access to spending information
- **Shura (Consultation):** Citizens empowered to question spending

---

## 🌟 Highlights

**Social Impact:**
- 🏛️ Increases government accountability
- 👥 Empowers citizens with information
- 📰 Supports investigative journalism
- 🛑 Deters corruption through visibility

**Technical Achievements:**
- On-chain government data (first in Indonesia)
- Real-time spending dashboard
- Public API for open data movement
- Scalable architecture (handles 1M+ records)

**Lessons Learned:**
- Government adoption requires relationship building
- Data quality > data quantity
- UX critical for citizen engagement
- Blockchain skepticism needs education

---

## 🗺️ Roadmap

**Phase 1: Proof of Concept** ✅
- [x] Smart contracts for budget recording
- [x] Dashboard prototype
- [x] Data pipeline (basic)

**Phase 2: Pilot Program** 🚧 (Q1-Q2 2026)
- [ ] Partner with 1 progressive city/regency
- [ ] Onboard select government officials
- [ ] Test with real budget data (limited scope)
- [ ] Gather feedback from citizens + officials

**Phase 3: Expansion** 📋 (Q3-Q4 2026)
- [ ] Scale to 5 cities
- [ ] Full ministry-level integration
- [ ] Mobile app launch
- [ ] Media partnerships for reach

**Phase 4: National Scale** 📋 (2027)
- [ ] National government adoption
- [ ] Integration with existing systems (SPAN, SAKTI)
- [ ] Regional language support
- [ ] Open data community building

---

## 🤝 Contributing

This is a public good project—contributions welcome!

**How you can help:**
- 🧑‍💻 **Developers** - Improve dashboard, API, scrapers
- 📊 **Data Scientists** - Build anomaly detection
- 🎨 **Designers** - Enhance UX for non-tech users
- 🌐 **Translators** - Localize to regional languages
- 📢 **Advocates** - Spread awareness, government outreach

---

## 📄 License

MIT License (open source for public good)

---

## 🙏 Acknowledgments

- Indonesian civil society orgs fighting for transparency
- Code for Indonesia community
- Solana Foundation for grants (applied)
- Journalists who inspired this project

---

## 🔗 Links

- 🌐 [rectorspace.com](https://rectorspace.com)
- 🐙 [@rz1989s](https://github.com/rz1989s)
- 🏛️ [RECTOR-LABS](https://github.com/RECTOR-LABS)

---

<div align="center">

**Built with Bismillah** 🕌

*"O you who believe, be persistently standing firm in justice, witnesses for Allah." - Quran 4:135*

May this tool serve the people and uphold justice. Aamiin.

---

[🏛️ RECTOR LABS](https://github.com/RECTOR-LABS) | Building for Eternity | 2025

[![Solana](https://img.shields.io/badge/Solana-14F195?style=flat&logo=solana&logoColor=black)](https://solana.com)
[![Public Good](https://img.shields.io/badge/Public_Good-Civic_Tech-41CFFF?style=flat)](https://github.com/RECTOR-LABS)
[![Indonesia](https://img.shields.io/badge/🇮🇩_Indonesia-First-FF0000?style=flat)](https://indonesia.go.id)

</div>
