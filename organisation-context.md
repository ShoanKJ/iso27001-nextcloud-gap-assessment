# Organisation Context
## ISO 27001:2022 Gap Assessment — Nextcloud Server

| Field | Detail |
|---|---|
| **Document Type** | Organisation Context (ISO 27001:2022 Clause 4) |
| **Subject** | Nextcloud GmbH — `nextcloud/server` |
| **Date** | 09 June 2026 |
| **Version** | 1.0 |

---

## 1. Understanding the Organisation and Its Context (Clause 4.1)

### 1.1 Organisation Overview

**Nextcloud GmbH** is a privately held German software company headquartered in Stuttgart, Germany. It was founded in 2016 by Frank Karlitschek, a former co-founder of ownCloud. The company develops and maintains **Nextcloud Server** — a self-hosted, open-source platform for file sharing, team collaboration, and communication. It is among the most widely deployed open-source cloud platforms globally, used by governments, universities, healthcare organisations, and enterprises requiring data sovereignty.

The organisation operates under a **dual open-source / commercial model**:
- The Nextcloud Server software is released under the **GNU AGPL-3.0** licence, freely available to anyone
- Nextcloud GmbH generates revenue through **enterprise subscriptions**, support contracts, and professional services
- A global community of 1,200+ contributors participate in development via GitHub

### 1.2 Mission and Strategic Objectives

Nextcloud's stated mission is to provide *"a safe home for all your data"* — enabling individuals and organisations to retain full control over their data without dependence on third-party cloud providers. Key strategic objectives relevant to information security include:

- Maintaining **trust and transparency** with the user community through open-source development and public security advisories
- Achieving **regulatory compliance** for enterprise customers (GDPR, HIPAA, NIS2)
- Supporting **digital sovereignty** for public sector and critical infrastructure operators
- Sustaining a **secure development lifecycle** to prevent vulnerabilities in software deployed by millions

### 1.3 Internal Context

| Factor | Detail |
|---|---|
| **Legal structure** | GmbH (private limited company) under German law |
| **Jurisdiction** | Germany (EU) — subject to GDPR, German BDSG |
| **Staff** | ~100 employees (Nextcloud GmbH); 1,200+ community contributors |
| **Development model** | Open-source; contributions via GitHub pull request; core team employed by Nextcloud GmbH |
| **Primary language** | PHP (server-side), JavaScript/Vue.js (front-end) |
| **Release cadence** | Annual major releases; monthly maintenance releases; rolling security patches |
| **Security support window** | 1 year per major version |
| **Bug bounty** | HackerOne (`hackerone.com/nextcloud`) — active since 2016 |
| **Key repositories** | `nextcloud/server`, `nextcloud/desktop`, `nextcloud/android`, `nextcloud/ios` |
| **Documentation** | `docs.nextcloud.com` |

### 1.4 External Context

| Factor | Detail |
|---|---|
| **Market** | Cloud storage, collaboration, and file-sharing platforms |
| **Primary competitors** | Microsoft 365 / SharePoint, Google Workspace, Seafile, ownCloud |
| **Customer sectors** | Government, healthcare, education, enterprise |
| **Regulatory environment** | GDPR (EU), NIS2 Directive, German BDSG, sector-specific regulations (HIPAA, etc.) |
| **Threat landscape** | Supply chain attacks on OSS, web application vulnerabilities (XSS, CSRF, SQL injection), credential theft, ransomware targeting self-hosted deployments |
| **Geopolitical** | Strong European digital sovereignty push (EU Cyber Resilience Act) increases demand and scrutiny |
| **Dependencies** | GitHub (source code hosting, CI/CD), HackerOne (vulnerability disclosure), PHP ecosystem (Composer), npm ecosystem |

---

## 2. Understanding the Needs and Expectations of Interested Parties (Clause 4.2)

| Interested Party | Security Needs and Expectations |
|---|---|
| **Enterprise customers** | Contractual security assurances, SLAs, GDPR compliance, audit reports, penetration test evidence |
| **End users (self-hosted)** | Secure software free from known vulnerabilities; timely security updates |
| **Open-source contributors** | Clear security responsibilities, safe handling of vulnerability reports, contributor data protection |
| **Nextcloud GmbH employees** | Clear security policies, secure tooling, training, defined responsibilities |
| **HackerOne security researchers** | Prompt triage, fair attribution, transparent disclosure timeline |
| **Regulatory bodies (EU/German)** | GDPR compliance, data protection impact assessments, DPO appointment |
| **Hosting/infrastructure partners** | Clear security requirements and shared responsibility model |
| **GitHub (platform provider)** | Compliance with platform terms; responsible use of CI/CD infrastructure |
| **App ecosystem developers** | Secure APIs, documented security requirements for app store submissions |

---

## 3. Determining the Scope of the ISMS (Clause 4.3)

### 3.1 Proposed ISMS Scope Statement

> *"The Information Security Management System covers the development, security testing, release management, and vulnerability disclosure processes for the Nextcloud Server open-source project (`nextcloud/server`) as operated by Nextcloud GmbH, including the GitHub-hosted CI/CD pipeline, contributor access management, and security advisory processes."*

### 3.2 In-Scope Assets

| Asset Category | Specific Assets |
|---|---|
| **Source code** | `nextcloud/server` and all first-party repositories under the `nextcloud` GitHub organisation |
| **CI/CD infrastructure** | GitHub Actions workflows, build runners, npm/Composer dependency resolution |
| **Credentials and secrets** | GitHub personal access tokens, release signing keys (GPG), CI/CD secrets, HackerOne API tokens |
| **Contributor data** | GitHub usernames, email addresses, contribution history, HackerOne reporter details |
| **Security vulnerability data** | Unpatched vulnerability reports received via HackerOne (pre-disclosure) |
| **Release artefacts** | Compiled release packages, checksums, GPG signatures |
| **Documentation** | Security policy, threat model, admin docs, developer docs |
| **Communication channels** | Security mailing list, HackerOne platform, GitHub Issues/PRs |

### 3.3 Out-of-Scope

- **Self-hosted Nextcloud deployments** operated by third-party customers or individuals
- **Community-maintained apps** not owned by Nextcloud GmbH
- **Physical office premises** of Nextcloud GmbH (assessed separately; no physical controls in scope for this document)
- **Personal devices** of community contributors (outside Nextcloud GmbH's control)

---

## 4. Information Security Management System (Clause 4.4)

Nextcloud does not currently operate a formally documented ISMS. The gap assessment (see `assessment-report.md`) identifies the controls and processes that need to be established. The table below maps the current state of Clause 4 inputs.

| ISMS Component | Current State | Gap |
|---|---|---|
| Security policies | SECURITY.md, Code of Ethics | No overarching ISMS policy document |
| Risk assessment process | Ad hoc (HackerOne triage) | No formal risk assessment methodology |
| Risk treatment plan | Patch-and-release per SECURITY.md | No risk register or formal treatment records |
| Statement of Applicability | Not produced | Required for certification |
| Asset register | Not documented | See NC-02 in gap assessment |
| Roles and responsibilities | Informal (security team) | No published RACI or ISMS org chart |
| Internal audit | Not conducted | Required for certification |
| Management review | Not documented | Required for certification |

---

## 5. SWOT Analysis — Information Security Posture

| | **Helpful** | **Harmful** |
|---|---|---|
| **Internal** | **Strengths:** Active HackerOne programme; published threat model; strong cryptographic implementation; enforced PR-based code review; AGPL-3.0 IP controls; Dependabot active | **Weaknesses:** No formal ISMS or security policies; no asset inventory; no IRP; no supplier risk management; no mandatory SAST enforcement; no offboarding procedure |
| **External** | **Opportunities:** EU Cyber Resilience Act drives demand for secure OSS; ISO 27001 certification would unlock enterprise procurement; growing security-researcher community | **Threats:** Supply chain attacks on PHP/npm dependencies; coordinated vulnerability exploitation pre-patch; key-person risk on core security team; GitHub platform outage/compromise |

---

## 6. Applicable Legal, Regulatory, and Contractual Requirements

| Requirement | Source | Applicability | Current Status |
|---|---|---|---|
| **GDPR (Regulation 2016/679)** | EU law | High — processes contributor and customer PII | Partial — privacy policy exists; DPA templates absent |
| **German BDSG** | German law | High — German-incorporated entity | Partial — assumed compliant via GDPR alignment |
| **NIS2 Directive** | EU law | Medium — software supplier to critical sectors | Gap — NIS2 supply chain security requirements not assessed |
| **EU Cyber Resilience Act** | EU law (2024) | High — commercial software with OSS elements | Gap — product security requirements not mapped |
| **AGPL-3.0 Licence** | Contractual | High — all source code | Implemented — CLA and copyright enforcement in place |
| **HackerOne Terms** | Contractual | Medium — vulnerability disclosure platform | Implemented — active programme |
| **GitHub Terms of Service** | Contractual | High — primary development platform | Partial — no formal GitHub usage policy |
| **ISO/IEC 29147** | Standard | Medium — coordinated vulnerability disclosure | Partial — process exists; not formally aligned to standard |

---

## 7. Key Risks Identified Through Context Analysis

The following high-level risks emerge from this context analysis and are expanded in the risk register (`nextcloud-iso27001-risk-register.xlsx`):

1. **Supply chain compromise** — Malicious dependency injected via Composer or npm could affect all self-hosted deployments globally
2. **Pre-patch vulnerability exploitation** — Window between HackerOne report and public patch release is a critical exposure period
3. **CI/CD credential compromise** — Long-lived GitHub Actions secrets could enable malicious release artefact injection
4. **Key-person dependency** — Core security team is small; loss of key personnel could compromise vulnerability triage and patch release capability
5. **Regulatory non-compliance** — Absence of formal ISMS documentation creates exposure under GDPR, NIS2, and the EU Cyber Resilience Act

---

*This document should be reviewed and updated annually or upon significant changes to the organisation, its context, or the threat landscape.*

*Evidence sources: `github.com/nextcloud/server`, `nextcloud.com`, `docs.nextcloud.com`, HackerOne public programme listing, GitHub repository metadata.*
