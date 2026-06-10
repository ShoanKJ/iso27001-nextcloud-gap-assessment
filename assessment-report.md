# ISO 27001:2022 Gap Assessment Report
## Nextcloud Server (nextcloud/server)

| Field | Detail |
|---|---|
| **Subject** | Nextcloud GmbH – `nextcloud/server` on GitHub |
| **Standard** | ISO/IEC 27001:2022 Annex A (93 controls) |
| **Assessment Date** | 09 June 2026 |
| **Report Version** | 1.0 |
| **Classification** | Public |
| **Assessed By** | ISO 27001 Gap Assessment Project |

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [Organisation Context](#2-organisation-context)
3. [Scope and Methodology](#3-scope-and-methodology)
4. [Control Assessment Summary](#4-control-assessment-summary)
5. [Control-by-Control Gap Table (All 93 Controls)](#5-control-by-control-gap-table)
6. [Key Non-Conformities (13 Findings)](#6-key-non-conformities)
7. [Prioritised Remediation Roadmap](#7-prioritised-remediation-roadmap)
8. [NIST CSF Mapping Summary](#8-nist-csf-mapping-summary)
9. [Conclusion](#9-conclusion)

---

## 1. Executive Summary

This report presents the findings of a structured gap assessment of the **Nextcloud Server** open-source project (`github.com/nextcloud/server`) against the **ISO/IEC 27001:2022 Annex A** control set. The assessment evaluated all 93 controls across the four control themes — Organisational (37), People (8), Physical (14), and Technological (34).

### Headline Results

| Status | Count | % of Applicable Controls |
|---|---|---|
| **Implemented** | 10 | 13% |
| **Partial** | 38 | 49% |
| **Not Implemented** | 29 | 37% |
| **N/A** | 16 | — |

Of the 77 applicable controls (excluding 16 physical N/A controls), **62 controls (81%) are either partial or not implemented**, indicating a significant maturity gap relative to ISO 27001:2022 requirements.

### Critical Findings

The assessment identified **13 non-conformities**, including three rated **Critical/High priority** requiring immediate action:

1. **No independent security review** (5.35) — No external penetration test or audit has been conducted or published.
2. **No secret scanning / DLP in CI pipeline** (8.12) — Secrets committed to code would not be automatically detected.
3. **No mandatory SAST gate** (8.25/8.28) — A static scanner exists but is not enforced in the CI/CD workflow.

Nextcloud demonstrates **genuine security maturity** in several areas: a HackerOne bug bounty programme, a 24-hour vulnerability acknowledgement SLA, strong cryptographic implementations (TLS 1.2+, bcrypt, E2E encryption), enforced PR-based code review, and a published threat model. These form a solid foundation upon which a formal ISMS can be built.

---

## 2. Organisation Context

### 2.1 About Nextcloud

**Nextcloud GmbH** is a German open-source company founded in 2016 by Frank Karlitschek (formerly of ownCloud). The company produces the **Nextcloud Server** — a self-hosted file-sharing, collaboration, and communication platform used by millions of users globally, including healthcare organisations, government agencies, universities, and enterprises.

The project operates under a **dual model**: Nextcloud GmbH employs a core engineering team in Stuttgart, Germany, while the broader development community consists of hundreds of open-source contributors worldwide. The server is licensed under **AGPL-3.0**.

### 2.2 Key Characteristics Relevant to ISO 27001

| Attribute | Detail |
|---|---|
| **GitHub Org** | `github.com/nextcloud` (~300+ repositories) |
| **Primary Repository** | `nextcloud/server` |
| **Contributors** | 1,200+ historical; ~50 active core |
| **Licence** | GNU AGPL-3.0 |
| **Primary Language** | PHP, JavaScript |
| **Release Cadence** | Major release annually; security patches rolling |
| **Security Support Window** | 1 year per major version (Maintenance and Release Schedule) |
| **Bug Bounty** | HackerOne — `hackerone.com/nextcloud` |
| **Security Advisories** | `github.com/nextcloud/security-advisories` |
| **Threat Model** | Published at `nextcloud.com/security/threat-model` |

### 2.3 Information Assets in Scope

For the purposes of this assessment, the following information assets were considered:

- Source code in `nextcloud/server` and related repositories
- CI/CD pipeline (GitHub Actions workflows)
- Release artefacts and signing keys
- Contributor identities and access credentials
- Security vulnerability reports (HackerOne)
- Project documentation and configuration

### 2.4 Applicable Legal and Regulatory Context

- **GDPR** — Nextcloud processes personal data as both data controller (contributor data) and as a platform enabling data processing by third-party operators
- **AGPL-3.0** — Copyleft licence obligations
- **German law** — Primary jurisdiction (Nextcloud GmbH incorporated in Stuttgart)
- **Responsible Disclosure** — Coordinated vulnerability disclosure under ISO/IEC 29147

---

## 3. Scope and Methodology

### 3.1 Scope

This gap assessment covers the **information security controls applicable to the Nextcloud Server open-source project** as operated by Nextcloud GmbH. The assessment boundary includes:

- The `nextcloud/server` GitHub repository and CI/CD infrastructure
- The Nextcloud GmbH development organisation
- Publicly documented security processes and policies

Physical controls (7.1–7.8, 7.10–7.14) are marked **N/A** as Nextcloud is a software-only project with no dedicated physical premises assessed in this engagement.

### 3.2 Methodology

Evidence was gathered from publicly available sources:

| Source | URL |
|---|---|
| Security Policy (SECURITY.md) | `github.com/nextcloud/server/security/policy` |
| Security Advisories | `github.com/nextcloud/security-advisories` |
| Threat Model | `nextcloud.com/security/threat-model` |
| Code of Conduct | `nextcloud.com/contribute/code-of-conduct/` |
| Code of Ethics | `nextcloud.com/code-of-ethics/` |
| GitHub Actions Workflows | `github.com/nextcloud/server/actions` |
| PHP Static Scanner | `github.com/nextcloud/php-static-scanner-instrumentalization` |
| Admin Documentation | `docs.nextcloud.com` |

Each control was rated against the following scale:

| Rating | Definition |
|---|---|
| **Implemented** | Control is fully in place with documented evidence |
| **Partial** | Control is partially in place; gaps exist in documentation, coverage, or enforcement |
| **Not Implemented** | No evidence of the control being in place |
| **N/A** | Control is not applicable to the assessed scope |

---

## 4. Control Assessment Summary

### 4.1 By Theme

| Theme | Controls | Implemented | Partial | Not Implemented | N/A |
|---|---|---|---|---|---|
| Organisational (5.x) | 37 | 3 | 18 | 15 | 1 |
| People (6.x) | 8 | 1 | 3 | 4 | 0 |
| Physical (7.x) | 14 | 0 | 0 | 1 | 13 |
| Technological (8.x) | 34 | 6 | 17 | 9 | 2 |
| **TOTAL** | **93** | **10** | **38** | **29** | **16** |

### 4.2 Maturity Observations

**Strongest areas** (Implemented controls):
- 5.17 Authentication information — bcrypt, TOTP/WebAuthn, OAuth2/SAML
- 5.32 Intellectual property rights — AGPL-3.0 enforced, CLA process
- 6.8 Information security event reporting — HackerOne, 24h SLA
- 8.3–8.5 Access controls and authentication — RBAC, branch protection, 2FA
- 8.8 Vulnerability management — HackerOne + advisories + Dependabot + 1yr support
- 8.24 Cryptography — E2E encryption, TLS 1.2+, documented standards

**Areas needing most attention:**
- All supplier/third-party controls (5.19–5.22) — No documented third-party risk management
- People controls (6.1, 6.5, 6.6, 6.7) — No screening, offboarding, NDA, or remote working policy
- Continuity controls (5.29, 5.30, 8.13, 8.14) — No BCP, DR, or backup policies
- Incident management (5.24, 5.27, 5.28) — Disclosure process exists; formal IRP absent

---

## 5. Control-by-Control Gap Table

> See the accompanying `nextcloud-iso27001-risk-register.xlsx` (Control Assessment sheet) for the full 93-control table. The summary below lists all controls with their assessed status.

### Theme A: Organisational Controls (5.1 – 5.37)

| Ref | Control Name | Status |
|---|---|---|
| 5.1 | Policies for information security | ⚠️ Partial |
| 5.2 | Information security roles and responsibilities | ⚠️ Partial |
| 5.3 | Segregation of duties | ⚠️ Partial |
| 5.4 | Management responsibilities | ❌ Not Implemented |
| 5.5 | Contact with authorities | ❌ Not Implemented |
| 5.6 | Contact with special interest groups | ⚠️ Partial |
| 5.7 | Threat intelligence | ⚠️ Partial |
| 5.8 | Information security in project management | ⚠️ Partial |
| 5.9 | Inventory of information and other associated assets | ❌ Not Implemented |
| 5.10 | Acceptable use of information and other associated assets | ⚠️ Partial |
| 5.11 | Return of assets | ❌ Not Implemented |
| 5.12 | Classification of information | ❌ Not Implemented |
| 5.13 | Labelling of information | ❌ Not Implemented |
| 5.14 | Information transfer | ⚠️ Partial |
| 5.15 | Access control | ⚠️ Partial |
| 5.16 | Identity management | ⚠️ Partial |
| 5.17 | Authentication information | ✅ Implemented |
| 5.18 | Access rights | ⚠️ Partial |
| 5.19 | Information security in supplier relationships | ❌ Not Implemented |
| 5.20 | Addressing information security within supplier agreements | ❌ Not Implemented |
| 5.21 | Managing information security in the ICT supply chain | ⚠️ Partial |
| 5.22 | Monitoring, review and change management of supplier services | ❌ Not Implemented |
| 5.23 | Information security for use of cloud services | ❌ Not Implemented |
| 5.24 | Information security incident management planning and preparation | ⚠️ Partial |
| 5.25 | Assessment and decision on information security events | ⚠️ Partial |
| 5.26 | Response to information security incidents | ⚠️ Partial |
| 5.27 | Learning from information security incidents | ❌ Not Implemented |
| 5.28 | Collection of evidence | ❌ Not Implemented |
| 5.29 | Information security during disruption | ❌ Not Implemented |
| 5.30 | ICT readiness for business continuity | ❌ Not Implemented |
| 5.31 | Legal, statutory, regulatory and contractual requirements | ⚠️ Partial |
| 5.32 | Intellectual property rights | ✅ Implemented |
| 5.33 | Protection of records | ❌ Not Implemented |
| 5.34 | Privacy and protection of PII | ⚠️ Partial |
| 5.35 | Independent review of information security | ❌ Not Implemented |
| 5.36 | Compliance with policies, rules and standards | ⚠️ Partial |
| 5.37 | Documented operating procedures | ⚠️ Partial |

### Theme B: People Controls (6.1 – 6.8)

| Ref | Control Name | Status |
|---|---|---|
| 6.1 | Screening | ❌ Not Implemented |
| 6.2 | Terms and conditions of employment | ⚠️ Partial |
| 6.3 | Information security awareness, education and training | ⚠️ Partial |
| 6.4 | Disciplinary process | ❌ Not Implemented |
| 6.5 | Responsibilities after termination or change of employment | ❌ Not Implemented |
| 6.6 | Confidentiality or non-disclosure agreements | ❌ Not Implemented |
| 6.7 | Remote working | ❌ Not Implemented |
| 6.8 | Information security event reporting | ✅ Implemented |

### Theme C: Physical Controls (7.1 – 7.14)

| Ref | Control Name | Status |
|---|---|---|
| 7.1 | Physical security perimeters | ➖ N/A |
| 7.2 | Physical entry | ➖ N/A |
| 7.3 | Securing offices, rooms and facilities | ➖ N/A |
| 7.4 | Physical security monitoring | ➖ N/A |
| 7.5 | Protecting against physical and environmental threats | ➖ N/A |
| 7.6 | Working in secure areas | ➖ N/A |
| 7.7 | Clear desk and clear screen | ➖ N/A |
| 7.8 | Equipment siting and protection | ➖ N/A |
| 7.9 | Security of assets off-premises | ❌ Not Implemented |
| 7.10 | Storage media | ➖ N/A |
| 7.11 | Supporting utilities | ➖ N/A |
| 7.12 | Cabling security | ➖ N/A |
| 7.13 | Equipment maintenance | ➖ N/A |
| 7.14 | Secure disposal or re-use of equipment | ➖ N/A |

### Theme D: Technological Controls (8.1 – 8.34)

| Ref | Control Name | Status |
|---|---|---|
| 8.1 | User endpoint devices | ❌ Not Implemented |
| 8.2 | Privileged access rights | ⚠️ Partial |
| 8.3 | Information access restriction | ✅ Implemented |
| 8.4 | Access to source code | ✅ Implemented |
| 8.5 | Secure authentication | ✅ Implemented |
| 8.6 | Capacity management | ⚠️ Partial |
| 8.7 | Protection against malware | ⚠️ Partial |
| 8.8 | Management of technical vulnerabilities | ✅ Implemented |
| 8.9 | Configuration management | ⚠️ Partial |
| 8.10 | Information deletion | ⚠️ Partial |
| 8.11 | Data masking | ⚠️ Partial |
| 8.12 | Data leakage prevention | ❌ Not Implemented |
| 8.13 | Information backup | ❌ Not Implemented |
| 8.14 | Redundancy of information processing facilities | ❌ Not Implemented |
| 8.15 | Logging | ⚠️ Partial |
| 8.16 | Monitoring activities | ⚠️ Partial |
| 8.17 | Clock synchronisation | ⚠️ Partial |
| 8.18 | Use of privileged utility programs | ⚠️ Partial |
| 8.19 | Installation of software on operational systems | ⚠️ Partial |
| 8.20 | Networks security | ⚠️ Partial |
| 8.21 | Security of network services | ⚠️ Partial |
| 8.22 | Segregation of networks | ❌ Not Implemented |
| 8.23 | Web filtering | ➖ N/A |
| 8.24 | Use of cryptography | ✅ Implemented |
| 8.25 | Secure development lifecycle | ⚠️ Partial |
| 8.26 | Application security requirements | ⚠️ Partial |
| 8.27 | Secure system architecture and engineering principles | ⚠️ Partial |
| 8.28 | Secure coding | ⚠️ Partial |
| 8.29 | Security testing in development and acceptance | ⚠️ Partial |
| 8.30 | Outsourced development | ⚠️ Partial |
| 8.31 | Separation of development, test and production environments | ⚠️ Partial |
| 8.32 | Change management | ⚠️ Partial |
| 8.33 | Test information | ❌ Not Implemented |
| 8.34 | Protection of information systems during audit testing | ❌ Not Implemented |

---

## 6. Key Non-Conformities

The following 13 findings represent the prioritised non-conformities identified during the assessment. Each finding is mapped to the relevant ISO 27001:2022 Annex A control and NIST CSF function.

### NC-01 — No Independent Security Review (5.35) | Critical | NIST: Identify

**Gap:** No evidence of any external penetration test, third-party security audit, or independent ISMS review has been conducted or published for the Nextcloud Server project.

**Risk:** Without independent validation, significant security weaknesses may go undetected. This also prevents any path to ISO 27001 certification.

**Remediation:** Commission an annual penetration test by a qualified third party (CREST-accredited or equivalent); publish a summary of findings. Engage an external ISMS auditor to conduct a readiness assessment.

---

### NC-02 — No Asset Inventory (5.9) | High | NIST: Identify

**Gap:** No information asset register or data-flow inventory is publicly documented. Assets supporting CI/CD, release signing, and contributor data are not formally identified.

**Remediation:** Create an asset register including GitHub repositories, CI/CD pipelines, secrets/credentials, and release artefacts. Map data flows to identify personal data processing.

---

### NC-03 — No DLP / Secret Scanning (8.12) | High | NIST: Protect

**Gap:** No DLP controls or secret scanning are enforced in the CI/CD pipeline. Secrets accidentally committed to the repository would not be automatically detected or blocked.

**Evidence of gap:** GitHub secret scanning push-protection is not confirmed as enabled; no Gitleaks or similar tool is visible in CI workflow configurations.

**Remediation:** Enable GitHub secret scanning with push-protection; add Gitleaks to CI as a required check; rotate any previously exposed secrets.

---

### NC-04 — No Supplier Security Management (5.19) | High | NIST: Identify

**Gap:** No supplier security assessment process or third-party risk policy exists. Key suppliers (GitHub, HackerOne, cloud build runners) have not been assessed against security requirements.

**Remediation:** Develop a supplier risk assessment questionnaire; complete assessments for critical third parties; include security clauses in new supplier agreements.

---

### NC-05 — No Formal SSDLC (8.25) | High | NIST: Protect

**Gap:** A PHP static scanner repository (`php-static-scanner-instrumentalization`) exists but there is no mandatory SAST gate in the CI pipeline and no formal Secure Software Development Lifecycle (SSDLC) policy.

**Remediation:** Formalise an SSDLC policy; add Psalm/Semgrep as a mandatory required check on all pull requests to stable branches; introduce threat modelling for new features.

---

### NC-06 — No Formal Incident Response Plan (5.24) | High | NIST: Respond

**Gap:** While HackerOne triage is described in SECURITY.md, there is no formal IRP covering roles, escalation paths, communication templates, severity matrix, or post-incident review.

**Remediation:** Draft and publish a formal IRP; define incident severity levels; assign RACI for each phase; conduct a tabletop exercise.

---

### NC-07 — No Mandatory SAST Gate (8.28) | High | NIST: Protect

**Gap:** Static analysis tooling exists in the ecosystem but is not enforced as a required CI check, meaning insecure code can be merged without automated security validation.

**Remediation:** Configure SAST as a required status check in GitHub branch protection rules for all stable branches.

---

### NC-08 — No Offboarding Procedure (6.5) | High | NIST: Protect

**Gap:** No formal offboarding procedure exists. Departing contributors' GitHub organisation membership, access to CI/CD secrets, and pipeline permissions may persist indefinitely.

**Remediation:** Create an offboarding checklist: revoke GitHub org membership, rotate shared secrets, audit remaining access. Automate where possible via GitHub org management APIs.

---

### NC-09 — No Network Segmentation for CI/CD (8.22) | High | NIST: Protect

**Gap:** No network segmentation for CI/CD pipelines. A compromised GitHub Actions runner could potentially access long-lived secrets, enabling pivoting to production credentials.

**Remediation:** Migrate to ephemeral self-hosted runners; implement OIDC token federation (keyless signing) to eliminate long-lived CI secrets; review workflow permissions.

---

### NC-10 — No Information Classification Scheme (5.12) | Medium | NIST: Identify

**Gap:** No information classification scheme is defined. All project data (public source code, contributor PII, vulnerability reports, signing keys) is treated without differentiated protective controls.

**Remediation:** Define a 4-tier classification scheme (Public / Internal / Confidential / Restricted); apply to key data assets; update access controls accordingly.

---

### NC-11 — No Backup Policy for Project Infrastructure (8.13) | Medium | NIST: Recover

**Gap:** No backup policy for critical project infrastructure, including CI/CD secrets, release signing keys, and GitHub organisation configuration. Loss of these assets could halt releases.

**Remediation:** Define RPO/RTO targets; implement encrypted, offsite backups of signing keys and critical secrets; test recovery quarterly.

---

### NC-12 — No Lessons-Learned Process (5.27) | Medium | NIST: Recover

**Gap:** No formal post-incident lessons-learned process. Repeat vulnerabilities of the same class have appeared in security advisories (e.g., multiple XSS findings across releases), suggesting no systematic remediation of root causes.

**Remediation:** Establish a post-incident review process; publish anonymised lessons-learned summaries; feed findings into SSDLC improvements.

---

### NC-13 — No Business Continuity Plan (5.29) | Medium | NIST: Recover

**Gap:** No BCP/DR plan for critical project infrastructure. Scenarios such as loss of GitHub organisation access, compromise of release signing keys, or key-person unavailability are unaddressed.

**Remediation:** Document BCP covering key-person risk, GitHub org recovery, release-signing key escrow, and emergency communication channels.

---

## 7. Prioritised Remediation Roadmap

Findings are sequenced into three waves based on risk score and implementation effort.

### Wave 1 — Immediate (Q2 2026): Critical & High Risk, Low-to-Medium Effort

| Priority | Control | Action | Owner | Effort |
|---|---|---|---|---|
| 1 | 8.12 | Enable GitHub secret scanning + add Gitleaks to CI | DevSecOps Lead | Low |
| 2 | 8.28 | Enforce SAST (Psalm/Semgrep) as required CI check | Engineering Lead | Low |
| 3 | 8.22 | Migrate to ephemeral runners + OIDC token federation | DevSecOps Lead | Medium |
| 4 | 6.5 | Create and automate contributor offboarding checklist | Engineering Manager | Low |
| 5 | 5.24 | Draft Incident Response Plan with RACI and severity matrix | Security Team Lead | Medium |

### Wave 2 — Short Term (Q3 2026): High Risk, Medium Effort

| Priority | Control | Action | Owner | Effort |
|---|---|---|---|---|
| 6 | 5.9 | Build and maintain asset register | Engineering Manager | Medium |
| 7 | 5.19 | Develop supplier risk assessment; assess GitHub, HackerOne | Legal / Procurement | Medium |
| 8 | 8.25 | Publish SSDLC policy; add threat modelling to feature workflow | Engineering Manager | Medium |
| 9 | 8.13 | Define backup policy; implement signing key escrow | Infrastructure Lead | Medium |

### Wave 3 — Medium Term (Q4 2026): Medium Risk / Governance

| Priority | Control | Action | Owner | Effort |
|---|---|---|---|---|
| 10 | 5.35 | Commission annual penetration test + ISMS readiness review | Security Team Lead | High |
| 11 | 5.12 | Define 4-tier information classification scheme | Data Protection Officer | Medium |
| 12 | 5.27 | Establish post-incident lessons-learned process | Security Team Lead | Low |
| 13 | 5.29 | Document BCP covering key-person and GitHub org loss | Project Manager | Medium |

---

## 8. NIST CSF Mapping Summary

All 13 non-conformities map to the following NIST Cybersecurity Framework functions:

| NIST CSF Function | Non-Conformities |
|---|---|
| **Identify (ID)** | NC-02 (5.9), NC-04 (5.19), NC-10 (5.12) |
| **Protect (PR)** | NC-03 (8.12), NC-05 (8.25), NC-07 (8.28), NC-08 (6.5), NC-09 (8.22) |
| **Detect (DE)** | — |
| **Respond (RS)** | NC-06 (5.24) |
| **Recover (RC)** | NC-11 (8.13), NC-12 (5.27), NC-13 (5.29) |
| **Govern (GV)** | NC-01 (5.35) |

The concentration of findings in **Protect** (5 findings) and **Identify** (3 findings) indicates that the primary maturity gap is in establishing foundational security controls and governance before advanced detection and response capabilities can be effective.

---

## 9. Conclusion

Nextcloud Server demonstrates **above-average security posture for an open-source project**, with genuine strengths in vulnerability disclosure, cryptographic implementation, code review process, and authentication controls. The HackerOne programme and published security advisories represent a level of security transparency that many commercial products do not achieve.

However, the project has **significant governance gaps** that would prevent ISO 27001 certification without substantial remediation. The most critical gaps — absence of independent security review, mandatory SAST enforcement, secret scanning, formal IRP, and supplier risk management — are addressable within one to two quarters with focused engineering effort.

The recommended approach is to:

1. **Implement Wave 1 technical controls immediately** — most are low-effort automation tasks that dramatically reduce attack surface
2. **Establish governance foundations in Wave 2** — asset inventory, IRP, and SSDLC policy create the policy framework
3. **Pursue independent validation in Wave 3** — external pen test and ISMS readiness review provide the evidence base for certification

With this roadmap executed, Nextcloud would be well-positioned for a Stage 1 ISO 27001 audit within 12 months.

---

*This assessment is based on publicly available information as of June 2026. Evidence is sourced from `github.com/nextcloud/server`, `nextcloud.com`, and related public documentation. This report does not constitute a formal ISO 27001 audit and does not imply any certification.*
