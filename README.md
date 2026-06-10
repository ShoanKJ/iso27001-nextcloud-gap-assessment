# ISO 27001:2022 Gap Assessment — Nextcloud Server

> A structured, evidence-based gap assessment of the **Nextcloud Server** open-source project (`nextcloud/server`) against **ISO/IEC 27001:2022 Annex A** — all 93 controls assessed.

---

## 📋 Project Overview

| Field | Detail |
|---|---|
| **Subject** | Nextcloud GmbH — `github.com/nextcloud/server` |
| **Standard** | ISO/IEC 27001:2022 Annex A (93 controls) |
| **Assessment Date** | 09 June 2026 |
| **Controls Assessed** | 93 (Organisational: 37 · People: 8 · Physical: 14 · Technological: 34) |
| **Non-Conformities Found** | 13 (1 Critical · 8 High · 4 Medium) |
| **Evidence Sources** | Publicly available GitHub repos, security policy, threat model, docs |

---

## 📁 Repository Contents

```
├── README.md                              ← This file
├── organisation-context.md               ← ISO 27001 Clause 4 context writeup
├── assessment-report.md                  ← Full gap assessment report
│   ├── Executive Summary
│   ├── Organisation Context
│   ├── Control-by-Control Gap Table (all 93)
│   ├── 13 Prioritised Non-Conformities
│   └── Remediation Roadmap (3 waves)
├── risk-register.csv                     ← Machine-readable risk register (13 findings)
└── nextcloud-iso27001-risk-register.xlsx ← Full Excel workbook with 3 sheets:
    ├── Sheet 1: Control Assessment        (all 93 controls)
    ├── Sheet 2: Risk Register             (13 findings, risk scores, owners)
    └── Sheet 3: Summary Dashboard        (traffic-light summary + KPIs)
```

---

## 📊 Headline Results

| Status | Count | % of Applicable Controls |
|---|---|---|
| ✅ Implemented | 10 | 13% |
| ⚠️ Partial | 38 | 49% |
| ❌ Not Implemented | 29 | 37% |
| ➖ N/A | 16 | — |

**77 applicable controls · 62 (81%) require remediation**

### By Theme

| Theme | Total | ✅ Impl | ⚠️ Partial | ❌ Not Impl | ➖ N/A |
|---|---|---|---|---|---|
| Organisational (5.x) | 37 | 3 | 18 | 15 | 1 |
| People (6.x) | 8 | 1 | 3 | 4 | 0 |
| Physical (7.x) | 14 | 0 | 0 | 1 | 13 |
| Technological (8.x) | 34 | 6 | 17 | 9 | 2 |
| **Total** | **93** | **10** | **38** | **29** | **16** |

---

## 🔴 Top Non-Conformities

| # | Control | Finding | Risk | NIST CSF |
|---|---|---|---|---|
| NC-01 | 5.35 | No external security audit or penetration test | Critical | Identify |
| NC-02 | 5.9 | No asset register or data-flow inventory | High | Identify |
| NC-03 | 8.12 | No DLP or secret scanning in CI pipeline | High | Protect |
| NC-04 | 5.19 | No supplier security assessment process | High | Identify |
| NC-05 | 8.25 | No formal SSDLC; SAST not enforced in CI | High | Protect |
| NC-06 | 5.24 | No formal Incident Response Plan | High | Respond |
| NC-07 | 8.28 | SAST tooling exists but not a required CI gate | High | Protect |
| NC-08 | 6.5 | No contributor offboarding procedure | High | Protect |
| NC-09 | 8.22 | CI/CD runners not isolated; long-lived secrets | High | Protect |
| NC-10 | 5.12 | No information classification scheme | Medium | Identify |
| NC-11 | 8.13 | No backup policy for project infrastructure | Medium | Recover |
| NC-12 | 5.27 | No lessons-learned process post-incident | Medium | Recover |
| NC-13 | 5.29 | No Business Continuity Plan | Medium | Recover |

---

## 🗺️ Remediation Roadmap

### Wave 1 — Immediate (Q2 2026) · Technical Quick Wins
- Enable GitHub secret scanning + Gitleaks in CI *(8.12)*
- Enforce SAST (Psalm/Semgrep) as required CI check *(8.28)*
- Migrate to ephemeral runners + OIDC token federation *(8.22)*
- Create contributor offboarding checklist *(6.5)*
- Draft Incident Response Plan *(5.24)*

### Wave 2 — Short Term (Q3 2026) · Governance Foundation
- Build and maintain asset register *(5.9)*
- Develop supplier risk assessment process *(5.19)*
- Publish formal SSDLC policy *(8.25)*
- Define backup policy and signing-key escrow *(8.13)*

### Wave 3 — Medium Term (Q4 2026) · Certification Readiness
- Commission annual penetration test *(5.35)*
- Define information classification scheme *(5.12)*
- Establish post-incident lessons-learned process *(5.27)*
- Document Business Continuity Plan *(5.29)*

---

## 🏆 Nextcloud Security Strengths

Despite the gaps above, Nextcloud demonstrates above-average security maturity for an open-source project:

- ✅ **HackerOne bug bounty** — Active since 2016; 24-hour acknowledgement SLA
- ✅ **Public security advisories** — Full CVE disclosure at `github.com/nextcloud/security-advisories`
- ✅ **Published threat model** — `nextcloud.com/security/threat-model`
- ✅ **Strong cryptography** — E2E encryption, TLS 1.2+, bcrypt, server-side encryption
- ✅ **Enforced code review** — Branch protection + CODEOWNERS + required PR reviews
- ✅ **Dependabot** — Automated dependency vulnerability scanning
- ✅ **1-year security support window** per major version

---

## 🔍 Methodology

Evidence was gathered exclusively from **publicly available sources**:

| Source | URL |
|---|---|
| Security Policy | `github.com/nextcloud/server/security/policy` |
| Security Advisories | `github.com/nextcloud/security-advisories` |
| Threat Model | `nextcloud.com/security/threat-model` |
| Code of Conduct | `nextcloud.com/contribute/code-of-conduct/` |
| Code of Ethics | `nextcloud.com/code-of-ethics/` |
| Admin Documentation | `docs.nextcloud.com` |
| PHP Static Scanner | `github.com/nextcloud/php-static-scanner-instrumentalization` |
| GitHub Actions | `github.com/nextcloud/server/actions` |

### Control Rating Scale

| Rating | Definition |
|---|---|
| ✅ **Implemented** | Control fully in place with documented evidence |
| ⚠️ **Partial** | Control partially in place; gaps in documentation, coverage, or enforcement |
| ❌ **Not Implemented** | No evidence of the control being in place |
| ➖ **N/A** | Control not applicable to the assessed scope |

---

## 📎 NIST CSF Mapping

All findings are mapped to NIST Cybersecurity Framework functions:

| Function | Findings |
|---|---|
| **Identify** | NC-01, NC-02, NC-04, NC-10 |
| **Protect** | NC-03, NC-05, NC-07, NC-08, NC-09 |
| **Detect** | — |
| **Respond** | NC-06 |
| **Recover** | NC-11, NC-12, NC-13 |

---

## ⚠️ Disclaimer

This assessment is based on publicly available information as of June 2026. It does not constitute a formal ISO 27001 audit, does not imply any certification, and was conducted for professional development purposes. All evidence is sourced from public GitHub repositories and official Nextcloud documentation.

---

*ISO/IEC 27001:2022 is a standard published by the International Organization for Standardization. NIST CSF is published by the National Institute of Standards and Technology.*
