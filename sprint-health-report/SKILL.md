---
name: sprint-health-report
description: "Analyze sprint-level CSV data and generate project health reports for status meetings. Supports multiple audiences (operational, executive, stakeholder), output formats (markdown, HTML slides, PPTX), and a structured review workflow with data fact-checking. Use when the user asks about project health, sprint metrics, status reports, or KPI analysis."
---

# Sprint Health Report Skill

Agent skill following the [AgentSkills.io](https://agentskills.io) standard. Portable across any host that supports the format.

## Overview

Generates actionable executive summaries of software development project health from sprint-level CSV data. Designed for a biweekly status meeting cadence.

## Files

| File | Purpose |
|------|---------|
| `SKILL.md` | This file. Entry point, analysis logic, prompt template. |
| `README.md` | How to use the skill: workflow, commands, tips. |
| `assets/templates/operational-report.md` | Template for Operational report. |
| `assets/templates/executive-report.md` | Template for Executive HTML slide deck. |
| `assets/templates/stakeholder-report.md` | Template for Stakeholder report. |
| `examples/` | Sample outputs for reference. |

**Start here**: Read this file for the analysis spec. See [README.md](README.md) for detailed workflow and tips.

## Suggested workflow

When the user asks for a report, guide them through this sequence. Each step builds on the previous.

1. **Operational report** (`audience: operational`, `format: markdown`) — Full analysis, all metrics, fact-check tags (🔵/🟠). Source of truth. Generate this first.
2. **Review** — User reviews the operational report and provides context or corrections (e.g. known causes for spikes, resolved items). Incorporate feedback; this context carries into steps 3 and 4.
3. **Executive report** (`audience: executive`, `format: html` or `markdown`) — Solutions-first, no 🟠 unverified alerts. Every problem has a solution. Generate only after review step (or explicit user request).
4. **Stakeholder report** (`audience: stakeholder`, optional) — Cross-team focus, dependencies, PI-level. Omit team internals.

**Rules:** Always start with step 1 (operational). Do not skip to executive or stakeholder without a reviewed operational report unless the user explicitly asks. For a quick scan only, step 1 with `projects: ALL` is enough.

---

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `projects` | string/list | `ALL` | Project name(s), group/ART description, or `ALL` for portfolio. Natural language OK. |
| `audience` | enum | `operational` | `operational` · `executive` · `stakeholder` |
| `format` | enum | `markdown` | `markdown` · `html` · `pptx` |
| `trend_window` | int | `4` | Completed sprints for trend analysis |
| `report_date` | date | today | Report header date |

## Project resolution

Projects can be referenced by exact CSV name or natural language. Resolve which projects to include using:

1. **Exact match** against the `Project` column in the CSV.
2. **Fuzzy match** — e.g. "team-a" → "TeamA", "backend" → "BackendSvc". Use the actual project names from the data in the report.
3. **Grouping** — If the user refers to a group (e.g. "my ART teams", "all Data & Logistics projects"), infer from the CSV (e.g. `Business Unit`, project name patterns) when it's unambiguous. If ambiguous or the data doesn't support it, **ask the user to clarify** which projects they mean.

Do not maintain or refer to a cluster registry in the skill. Use the CSV and common sense; when in doubt, ask.

---

## Input Data

**In-progress sprints**: The most recent row(s) in the CSV may be for the **current sprint**—one that has not finished yet. That sprint can have incomplete or partial data (e.g. low Sprint %, many fields empty). When generating a report, **ignore unfinished sprints** and use only **completed** sprints. The report should be based on the **last finished sprint** (and the trend window of completed sprints before it). If in doubt, treat the latest sprint as potentially in-progress and prefer the previous sprint as "last completed" unless the data clearly indicates completion.

### CSV Schema

One row per sprint per project. Key columns:

| Column | Type | Notes |
|--------|------|-------|
| `Project` | string | Project identifier |
| `Title` | string | Sprint name (may contain context) |
| `Sprint Start/End Date` | string | `DD/MM/YYYY → DD/MM/YYYY` |
| `Sprint %` | string | European format: `92,51 %` |
| `Sprint Target` | int | Story points planned |
| `Sprint Complete` | int | Story points delivered |
| `Code smells (sum)` | int | Cumulative |
| `Critical Bugs` | int | |
| `Open Bugs` | int | |
| `Bugs resolved` | int | |
| `Test Coverage` | string | European format |
| `Team Mood` | string | 0–10 European. 0 = not reported |
| `Cycle time (days)` | string | European format |
| `Deployment lead time (working days)` | int | |
| `Deployments Prod` | int | |
| `Code security issues` | int | |
| `Security findings, platform (Overdue)` | int | |
| `Dependencies findings` | int | |
| `Business Unit` | string | |
| `NPS` | int | Sparse |

### Data Parsing Rules

1. European numbers: comma = decimal (`92,51 %` → 92.51). Strip NBSP.
2. **Finished vs unfinished sprints**: Only use **finished** (completed) sprints for the report. Treat the latest sprint in the data as possibly in-progress—if it has incomplete data (most fields empty, or Sprint % = 0 with Target > 0, or end date in the future), **ignore it** and take the last finished sprint as the report baseline. Incomplete/unfinished sprints are skipped for scoring and trends.
3. Team Mood = 0 → not reported, exclude from scoring.
4. Code Smells: trend direction only, never compare absolutes across projects.
5. <3 completed sprints → "insufficient data", skip trends.
6. Extract context from sprint titles when relevant.
7. Use project names exactly as they appear in the CSV.

### Portfolio and single-project scope

- **Portfolio report** (`projects = ALL` or portfolio overview): Include only **active** projects. A project is active if it has at least one **completed** sprint with an end date within the **past month or two** (e.g. last 60 days from the report date). Projects with no completed sprint in that window are excluded from the portfolio report so the overview reflects currently active work.
- **Single-project report** (user asks for a specific project): If the requested project has **no recent data** (e.g. no completed sprint in the past month or two), still produce the report from the latest available data but **add a clear note** at the top (e.g. in Executive Summary or Data Quality) that the project has no recent sprint data and the report is based on the last available sprint, with the date of that sprint. This avoids implying current health when the project may be dormant or tracking may have stopped.

---

## Metric Tiers & Weighting

| Tier | Weight | Metrics | Signal |
|------|--------|---------|--------|
| T1 Critical | 3× | Sprint %, Critical Bugs, Security Overdue | Delivery, quality, compliance |
| T2 Important | 2× | Open Bugs, Test Coverage, Team Mood, Cycle Time | Systemic health |
| T3 Informational | 1× | Code Smells, Bugs Resolved, Deployments, Dependencies | Context |

---

## Health Thresholds

Calibrated for typical agile portfolios; tune thresholds to your data if needed.

### Absolute

| Metric | ✅ Healthy | ⚠️ Watch | 🚨 Alert |
|--------|-----------|----------|----------|
| Sprint % | 75–115% | 60–75% or 115–140% | <60% or >140% |
| Critical Bugs | 0 | 1 | ≥2 |
| Open Bugs | ≤5 | 6–15 | >15 |
| Test Coverage | ≥85% | 75–85% | <75% |
| Team Mood | ≥7.5 | 6.0–7.5 | <6.0 |
| Cycle Time | ≤5d | 5–10d | >10d |
| Security Overdue | 0 | 1–3 | >3 |
| Code Security | 0 | 1–3 | >3 |

### Trend Escalation (override upward only)

| Condition | Effect |
|-----------|--------|
| Any metric >20% drop sprint-over-sprint | Escalate one level |
| Team Mood ≥1.5pt drop in window | Auto-🚨 |
| Test Coverage ≥3pp drop in window | ⚠️ minimum |
| Sprint % >40pp swing between sprints | ⚠️ (unstable) |
| Open Bugs net +5 in window | Escalate one level |
| Code Smells +30% over window | ⚠️ minimum |

### Scoring

`✅=0  ⚠️=1  🚨=2`

**Weighted Score** = Σ(status × tier_weight) / Σ(tier_weight for reported metrics)

| Score | Health |
|-------|--------|
| 0.0–0.3 | ✅ Healthy |
| 0.3–0.8 | ⚠️ Needs Attention |
| 0.8+ | 🚨 At Risk |

**Overrides**: T1 at 🚨 → project 🚨. ≥3 metrics at ⚠️ → project ⚠️ min.

---

## Data Fact-Check

Run **before** scoring. Prevents false alerts from reaching reports.

### Validation Rules

| Check | Rule | Action |
|-------|------|--------|
| Magnitude spike | >3× project historical max | 🟠 `VERIFY` |
| Sudden appearance | 0/empty 3+ sprints then spikes | 🟠 `VERIFY` |
| Impossible value | Coverage >100%, Sprint % >300%, negatives | `EXCLUDE` from scoring |
| Cross-project outlier | >5× portfolio median | 🟠 `VERIFY` |
| Completeness | >50% metrics empty in "completed" sprint | 🟠 `VERIFY` |

### Confidence Levels

| Level | Meaning |
|-------|---------|
| 🔵 High confidence | Consistent trend (3+ sprints) or multi-metric corroboration |
| 🟠 Needs verification | Single data point, first occurrence, magnitude outlier |

### Audience Filtering

| Audience | 🔵 High | 🟠 Needs verification |
|----------|---------|----------------------|
| `operational` | Full detail | Full detail + verify tag |
| `executive` | Shown with solution | **Omitted** |
| `stakeholder` | Shown if cross-team | Omitted |

---

## Built-in Heuristics

| Pattern | Handling |
|---------|----------|
| Holiday sprints (mid-Dec–mid-Jan, Aug) | Note "holiday period", don't alarm |
| IP/Innovation sprints | Exclude from velocity trend |
| Ramp-up (first 3-4 sprints) | Relax Sprint % green to 60-115% |
| Sprint title context | Extract and surface |
| Zero deployments across all sprints | Flag once as "tracking may not be configured" |
| Team Mood = 0 ≥2 sprints | "Action: Agile Coach to review team processes" |

---

## Context Annotations

Optional block for known issues. Prevents re-flagging resolved problems.

```xml
<context>
  <annotation project="ProjectX" metric="MetricName" sprint="Sprint N">
    Description of known cause and current status.
  </annotation>
  <annotation type="global" category="planning">
    Standing note applicable across projects.
  </annotation>
</context>
```

Annotated issues still show status but narrative shifts from "investigate" to "monitor/follow up."

---

## Audience Perspectives

### `operational` — Operational
All metrics, trends, flags, data quality. Concrete actions with owner hints. Fact-check flags with verify tags.

### `executive` — Executive
Lead with solutions. Every problem has a plan. Omit: unverified alerts, data noise, resolved personal issues. Graphs > tables. Concise.

### `stakeholder` — Stakeholder
Cross-team focus: delivery, dependencies, PI progress. Omit team internals. Collaborative framing.

---

## Quality Review

Before finalizing any output, verify:

- **Accuracy**: Data points match CSV, trends correct, scores right, annotations reflected
- **Fact-check**: Confidence levels assigned, unverified tagged, impossible values excluded
- **Audience**: Content appropriate for selected audience
- **Presentation**: Scannable, one message per slide (if applicable), charts readable
- **Emoji**: Consistent per conventions, max 1 per line, functional not decorative
- **Names**: Project names exactly as in the CSV; group/ART labels from user or context

Revise if any check fails.

---

## Emoji Conventions

| Emoji | Meaning | Usage |
|-------|---------|-------|
| ✅ | Healthy / resolved | Status, resolved items |
| ⚠️ | Watch | Status, verification |
| 🚨 | Alert / at risk | Status, urgent items |
| 👍 | Positive | Highlights |
| 📈 | Improving | Trends |
| 📉 | Declining | Trends |
| ➡️ | Stable | Trends |
| 🔵 | High confidence | Fact-check |
| 🟠 | Needs verification | Fact-check |
| 🔒 | Security | Security items |
| 🎯 | Action item | Recommendations |

Max 1 per line/cell. Never in prose. Functional only.

