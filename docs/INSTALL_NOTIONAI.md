# sprint-health-report on Notion AI

Notion AI cannot read `SKILL.md` directly. Instead, you create **instruction pages** that Notion AI references via `@`-mentions. This guide uses separate instruction pages per report type for focused context.

## Prerequisites

- Notion workspace with Notion AI enabled
- Sprint metrics database (one row per sprint per team)
- A Sprint Health Reports database (see [Reports database](#reports-database) below)

---

## Architecture

```
Sprint Metrics DB ──→ Instruction Page ──→ Sprint Health Reports DB
(source data)        (per audience)        (generated output)
```

Three instruction pages, one per audience:

| Instruction page | Audience | When to use |
|---|---|---|
| **Generate Operational Report** | operational | First — full analysis with fact-checks and follow-ups |
| **Generate Executive Report** | executive | After reviewing the operational report |
| **Generate Stakeholder Report** | stakeholder | After review — cross-team focus |

Each page is self-contained: shared rules (scoring, thresholds, data parsing) plus audience-specific rules and template.

---

## Reports database

Create a database called **Sprint Health Reports** with these properties:

| Property | Type | Notes |
|---|---|---|
| Name | Title | e.g. "Nexus — Sprint 103 Operational" |
| Project | Relation | Link to project (limit: 1) |
| Sprint | Relation | Link to sprint row (limit: 1) |
| Type | Select | `Operational`, `Executive`, `Stakeholder` |
| Status | Status | `Draft` → `For review` → `Reviewed` |

The report content goes in the **page body** (not a text property). This allows rich formatting: tables, to-do lists, callouts, toggle blocks, and inline comments during review.

The Status property uses Notion's built-in status groups:
- **To do**: Draft (default)
- **In progress**: For review (blue)
- **Complete**: Reviewed (green)

---

## Instruction pages

Each instruction page follows the same skeleton. Create three Notion pages with the content below. The shared sections (data rules, thresholds, scoring, fact-check) are identical across all three — only the audience rules and template differ.

### Shared sections (include in all three pages)

**1. Overview** — one paragraph: "This page instructs Notion AI to generate a [audience] sprint health report from the Sprint Metrics database."

**2. Data sources** — link to the Notion databases by URL so Notion AI can discover the schema at runtime:

```
Data sources:
- Sprint Metrics: [paste Sprint Metrics DB URL]
- Sprint Health Reports: [paste Sprint Health Reports DB URL]
- Previous report (if any): [paste URL of last operational report, or "none"]

Read the Sprint Metrics database to discover available teams, sprints,
and metric properties. Do not assume fixed column names — map the
metric concepts in this instruction page to whatever properties exist
in the database.
```

**3. Parameter confirmation** — "Before generating the report, confirm the following with the user:
- **Projects/teams**: list the teams found in the Sprint Metrics database that match the user's request. Ask the user to confirm the selection.
- **Report date**: confirm or default to today.
- **Trend window**: confirm or default to last 4 completed sprints.
Then proceed with the confirmed parameters."

**4. Data rules**
- One row per sprint per team in the metrics database
- Ignore unfinished sprints (incomplete data, Sprint % = 0 with Target > 0, or end date in future)
- Team Mood = 0 means "not reported" — exclude from scoring
- Fewer than 3 completed sprints → skip trends, note "insufficient data"
- Use last 4 completed sprints as trend window
- Portfolio scope: only active projects (completed sprint within past 60 days)

**5. Health thresholds** — metric concepts map to actual database properties at runtime.

Absolute thresholds:

| Metric | Healthy | Watch | Alert |
|---|---|---|---|
| Sprint % | 75–115% | 60–75% or 115–140% | <60% or >140% |
| Critical Bugs | 0 | 1 | ≥2 |
| Open Bugs | ≤5 | 6–15 | >15 |
| Test Coverage | ≥85% | 75–85% | <75% |
| Team Mood | ≥7.5 | 6.0–7.5 | <6.0 |
| Cycle Time | ≤5d | 5–10d | >10d |
| Security Overdue | 0 | 1–3 | >3 |
| Code Security | 0 | 1–3 | >3 |

Trend escalation (override upward only):

| Condition | Effect |
|---|---|
| Any metric >20% drop sprint-over-sprint | Escalate one level |
| Team Mood ≥1.5pt drop in window | Auto-Alert |
| Test Coverage ≥3pp drop in window | Watch minimum |
| Sprint % >40pp swing between sprints | Watch (unstable) |
| Open Bugs net +5 in window | Escalate one level |
| Code Smells +30% over window | Watch minimum |

**6. Scoring**

Metric tiers:
- T1 Critical (3× weight): Sprint %, Critical Bugs, Security Overdue
- T2 Important (2× weight): Open Bugs, Test Coverage, Team Mood, Cycle Time
- T3 Informational (1× weight): Code Smells, Bugs Resolved, Deployments, Dependencies

Scoring formula:
- Healthy=0, Watch=1, Alert=2
- Weighted Score = Σ(status × tier_weight) / Σ(tier_weight for reported metrics)
- 0.0–0.3 = Healthy, 0.3–0.8 = Needs Attention, 0.8+ = At Risk
- Override: any T1 at Alert → project Alert; 3+ metrics at Watch → project Watch minimum

**7. Fact-check rules** — run before scoring to prevent false alerts.

Validation rules:

| Check | Rule | Action |
|---|---|---|
| Magnitude spike | >3× project historical max | VERIFY |
| Sudden appearance | 0/empty 3+ sprints then spikes | VERIFY |
| Impossible value | Coverage >100%, Sprint % >300%, negatives | EXCLUDE from scoring |
| Cross-project outlier | >5× portfolio median | VERIFY |
| Completeness | >50% metrics empty in "completed" sprint | VERIFY |

Confidence levels:
- 🔵 High confidence — consistent trend (3+ sprints) or multi-metric corroboration
- 🟠 Needs verification — single data point, first occurrence, magnitude outlier

**8. Standing context** — "If a previous operational report is linked in the data sources, read its Standing Context & Review History section. Carry forward open items and apply them as context (shift narrative from 'investigate' to 'monitor/follow up'). Do not re-flag issues that were resolved in a previous review."

### Page 1: Generate Operational Report

Add the shared sections above, then:

**9. Audience rules**
- Show all metrics, all tiers
- Include both 🔵 and 🟠 fact-check tags
- Include follow-up action items directed at roles (Team Lead, Product Owner, Agile Coach)
- End with "Ready for your review"

**10. Template** — paste the operational report template from [operational-report.md](../sprint-health-report/assets/templates/operational-report.md) into a toggle block. Include the metrics table structure, narrative sections (What's Going Well, What Needs Attention, Recommended Actions, Follow-Ups), and data quality section.

Add this section to the template:

```
## Standing Context & Review History
Carry forward from the previous report. Update with new items from this sprint.
- [Open items, agreed threshold overrides, ongoing situations]
- [Previous review outcomes still relevant]
Remove resolved items. Keep last 3 cycles of history.
```

**11. Output** — "Create a new page in the Sprint Health Reports database. Set Type to Operational, Status to Draft. Link the Project and Sprint relations. Write the report as the page body."

> **Tip**: Include one worked example (e.g. the Nexus operational report from `examples/`) in a toggle block. This significantly improves output quality.

### Page 2: Generate Executive Report

Add the shared sections, then:

**9. Audience rules**
- Lead with solutions — every problem has a plan
- Use "Delivery Rate" instead of "Sprint %"
- Omit: 🟠 unverified alerts, data quality issues, raw metric tables, sprint-level volatility detail
- Max 5 bullets per section, each under 15 words
- Reference the reviewed operational report for corrections

**10. Template** — paste the executive report template from [executive-report.md](../sprint-health-report/assets/templates/executive-report.md). For Notion output, adapt the slide structure to sections (Notion doesn't generate HTML slides).

**11. Output** — "Create a new page in Sprint Health Reports. Set Type to Executive, Status to Draft. Link Project and Sprint. Write the report as the page body."

### Page 3: Generate Stakeholder Report

Add the shared sections, then:

**9. Audience rules**
- Cross-team focus: delivery predictability, dependencies, blockers, shared risks
- Use "Delivery Rate" instead of "Sprint %"
- Omit: team internals (mood details, code smells, individual coverage), 🟠 unverified alerts
- Collaborative framing — issues are shared problems, not team failures

**10. Template** — paste the stakeholder report template from [stakeholder-report.md](../sprint-health-report/assets/templates/stakeholder-report.md). Adapt slide structure to sections.

**11. Output** — "Create a new page in Sprint Health Reports. Set Type to Stakeholder, Status to Draft. Link Project and Sprint. Write the report as the page body."

---

## Usage

Reference an instruction page in Notion AI chat. The database URLs are embedded in the instruction page, so you only need to point at the instruction page itself.

### Step 1: Generate operational report

```
@Generate Operational Report
Generate a report for [project/team names or "all active projects"].
```

### Step 2: Review

Open the generated report in the Sprint Health Reports database. Move Status to **For review**. Read through, add inline comments or corrections. Move to **Reviewed** when done.

### Step 3: Generate executive report

```
@Generate Executive Report
Base on the reviewed report at @[Operational Report Page].
```

### Step 4: Generate stakeholder report

```
@Generate Stakeholder Report
Base on the reviewed report at @[Operational Report Page].
```

---

## Limitations

| Area | Limitation | Workaround |
|---|---|---|
| Multi-step workflow | Each chat is a fresh context | Reference the reviewed operational report when generating executive/stakeholder reports |
| Template fidelity | Notion AI may drift from exact structure | Include a worked example in each instruction page |
| HTML/PPTX output | Notion outputs rich text only | Export to PDF, or use the skill in Claude/Cursor for HTML slides |
| Context window | Full instruction page + large database may exceed limits | Generate per-project rather than "ALL" |
| Scoring precision | AI may approximate the weighted formula | Include a worked example with the calculation |
