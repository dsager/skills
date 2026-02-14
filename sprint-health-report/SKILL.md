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
| `QUICKREF.md` | Quick reference card for essential patterns and rules. |
| `_shared-conventions.md` | Common patterns: emoji usage, metric labeling, qualifiers, audience filters. |
| `_template-fragments.md` | Reusable formatting patterns: badges, tables, cards, headers. |
| `_data-reference.md` | Quick reference: thresholds, scoring, heuristics, validation rules. |
| `ARCHITECTURE.md` | File organization and design principles. |
| `templates/operational-report.md` | Template for Operational report. |
| `templates/executive-report.md` | Template for Executive HTML slide deck. |
| `templates/stakeholder-report.md` | Template for Stakeholder report. |
| `examples/` | Sample outputs for reference. |

**Start here**: Read this file for the analysis spec. See [QUICKREF.md](QUICKREF.md) for fast lookup, [README.md](README.md) for workflow, and reference files (`_*.md`) for conventions and data rules.

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

**Critical rule for in-progress sprints**: The most recent CSV row(s) may be unfinished (current sprint). **Only use completed sprints** for reporting. Treat latest sprint as potentially in-progress; prefer previous sprint as "last completed" unless data clearly shows completion.

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

1. **European numbers**: comma = decimal (`92,51 %` → 92.51). Strip NBSP.
2. **Finished sprints only**: Ignore in-progress sprints (incomplete data, Sprint % = 0 with Target > 0, or future end date).
3. **Team Mood = 0**: Not reported, exclude from scoring.
4. **Code Smells**: Trend direction only, never compare absolutes across projects.
5. **Trend minimum**: <3 completed sprints → "insufficient data".
6. **Sprint context**: Extract context from sprint titles when relevant.
7. **Project names**: Use exactly as they appear in CSV (see [_shared-conventions.md](_shared-conventions.md)).

### Portfolio and single-project scope

- **Portfolio** (`projects = ALL`): Include only **active** projects (completed sprint within past 60 days from report date).
- **Single-project**: If no recent data (no completed sprint in past 60 days), still produce report but note clearly that project may be dormant, with date of last sprint.

---

## Metric Tiers & Weighting

| Tier | Weight | Metrics | Signal |
|------|--------|---------|--------|
| T1 Critical | 3× | Sprint %, Critical Bugs, Security Overdue | Delivery, quality, compliance |
| T2 Important | 2× | Open Bugs, Test Coverage, Team Mood, Cycle Time | Systemic health |
| T3 Informational | 1× | Code Smells, Bugs Resolved, Deployments, Dependencies | Context |

---

## Health Thresholds

See [_data-reference.md](_data-reference.md) for complete thresholds, scoring formula, trend escalation rules, and built-in heuristics.

**Quick reference**: Thresholds calibrated for typical agile portfolios. Tune to your data if needed.

---

## Data Fact-Check

See [_data-reference.md](_data-reference.md) for validation rules. Run **before** scoring to prevent false alerts.

**Confidence levels & audience filtering**: See [_shared-conventions.md](_shared-conventions.md).

---

## Built-in Heuristics

See [_data-reference.md](_data-reference.md) for complete heuristics list. Key patterns: holiday sprints, IP sprints, ramp-up periods, zero deployments, mood tracking gaps.

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

See [_shared-conventions.md](_shared-conventions.md) for common omissions and patterns.

### `operational` — Operational
All metrics, trends, flags, data quality. Concrete actions with owner hints. All fact-check flags including verify tags.

### `executive` — Executive
Solutions-first. Every problem has a plan. Graphs > tables. Concise. (See _shared-conventions.md for omissions.)

### `stakeholder` — Stakeholder
Cross-team focus: delivery, dependencies, PI progress. Collaborative framing. (See _shared-conventions.md for omissions.)

---

## Quality Review

Before finalizing any output, verify:

- **Accuracy**: Data points match CSV, trends correct, scores right, annotations reflected
- **Fact-check**: Confidence levels assigned, unverified tagged, impossible values excluded
- **Audience**: Content appropriate per [_shared-conventions.md](_shared-conventions.md)
- **Presentation**: Scannable, one message per slide (if applicable), charts readable
- **Emoji**: Per [_shared-conventions.md](_shared-conventions.md) — max 1 per line, functional not decorative
- **Names**: Project names per [_shared-conventions.md](_shared-conventions.md)

Revise if any check fails.

---

## Emoji Conventions

See [_shared-conventions.md](_shared-conventions.md) for full emoji usage guidelines.

