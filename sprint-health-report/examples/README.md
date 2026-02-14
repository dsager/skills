# Sprint Health Report — Examples

Sample inputs and outputs for the sprint-health-report skill. Use these for reference when generating operational reports, executive reports, or portfolio overviews.

## Input data

| File | Description |
|------|-------------|
| **example-metrics.csv** | Example sprint-level metrics in the skill's CSV schema. Based on real data with **fictional project names** (Pulse, Nexus, Atlas, Depot, Quest). One row per sprint per project; European number format. Use for testing or as a template. |
| **example-sprint-health-log.md** | Example sprint health log showing standing context, events, and review history. Represents the state after one review cycle. Provide alongside the CSV for context continuity. |

## Report examples

All reports below are generated from `example-metrics.csv` with **report date 15 February 2026**. Active projects = at least one completed sprint in the past 60 days.

| File | Prompt | Audience | Description |
|------|--------|----------|-------------|
| **example-operational-report-nexus.md** | `projects: Nexus, audience: operational, format: markdown` | Operational | Full sprint health report for **Nexus**: metrics table with tiers and trends, what's going well, what needs attention, recommended actions, data quality. |
| **example-executive-report-nexus.md** | `projects: Nexus, audience: executive, format: markdown` | Executive | Concise status for **Nexus**: slide-style sections (health, delivery trajectory, risks & mitigations), solution-focused, no unverified alerts. |
| **example-executive-report-nexus.html** | `projects: Nexus, audience: executive, format: html` | Executive | HTML slide deck for **Nexus**: dark-themed, 5 slides (title, health cards, delivery trajectory SVG chart, risks & mitigations, summary). Arrow key navigation, self-contained. |
| **example-stakeholder-report.html** | `projects: all General-Engineering, audience: stakeholder, format: html` | Stakeholder | HTML slide deck for **General-Engineering BU** (Atlas, Depot, Nexus): project health cards with sparkline trends, dependencies & blockers, shared risks, BU-level actions. Collaborative framing, no team internals. |
| **example-portfolio-report.md** | `projects: ALL, audience: operational, format: markdown` | Operational | Portfolio report for **all active projects** (5): executive summary, health overview table, at-risk and watch-list sections, healthy list, data quality notes, top actions. Illustrates active-only filter (past 60 days) and fact-check (e.g. Pulse Sprint % VERIFY). |

## How to use

- **Regenerate reports**: Point the skill at `example-metrics.csv` and request an operational report, executive report, or portfolio report; use `report_date` 15 Feb 2026 (or adjust to match the data).
- **Single project**: e.g. "Operational report for Nexus using example-metrics.csv" or "Executive report for Nexus from examples/example-metrics.csv".
- **BU / group**: e.g. "Stakeholder report for all General-Engineering projects from example-metrics.csv".
- **Portfolio**: e.g. "Portfolio overview from example-metrics.csv"; only projects with a completed sprint in the past 60 days are included.

See the skill's [SKILL.md](../SKILL.md) and [README.md](../README.md) in the parent folder for parameters, thresholds, and workflow.
