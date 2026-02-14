# Sprint Health Report

A skill that analyzes sprint-level CSV data and generates project health reports for status meetings. Use it with any agent or IDE that supports the SKILLs standard (e.g. Claude, Cursor, or other).

**Supports:** multiple audiences (operational, executive, stakeholder), output formats (markdown, HTML slides, PPTX), and a structured review workflow with data fact-checking. Might depend on your tooling.

**Full spec:** [SKILL.md](SKILL.md) — parameters, CSV schema, thresholds, fact-check rules, templates.

**Format:** Standard agent skill (directory with required `SKILL.md`, optional `templates/` and `examples/`). See [AgentSkills.io specification](https://agentskills.io/specification).

---

## Quick Start

1. Attach your sprint CSV
2. Tell the agent what you want:

```
Analyze the attached CSV for my [project or group] teams.
```

The agent resolves project names by exact or fuzzy match against the CSV, and can infer groups (e.g. by Business Unit) when clear. If unclear, it will ask. Examples:

- "give me the report for [ProjectA] and [ProjectB]"
- "how's [project name] doing?"
- "portfolio overview" / "all projects"
- "all teams in [Business Unit]" (when the CSV supports it)

---

## Workflow

Reports are built in steps. Each step builds on the previous one.

```
 STEP 1 ─── Operational Report ─── your working analysis
    │         full detail, fact-check, all flags
    ▼
 STEP 2 ─── Review ─────────────── you add context & corrections
    │         resolve verify flags, annotate known issues
    ▼
 STEP 3 ─── Executive Report ───── presentation-ready
    │         solutions-first, no unverified alerts
    ▼
 STEP 4 ─── Stakeholder Report ─── cross-team view (optional)
              dependencies, PI-level
```

### Step 1: Generate your report

```
Analyze the attached CSV for [projects or group].
Audience: operational | Format: markdown
```

You'll get: full analysis with health scores, trends, flags, and fact-check verification tags on any suspicious data points.

### Step 2: Review loop

Read through the report. Provide corrections and context:

```
Feedback:
- The security spike on [project] is under investigation, not yet in prod
- The mood drop on [project] was a personal situation, team lead handled it
- Sprint target swings are due to holiday season

Update the report.
```

Repeat until you're satisfied. Your context carries forward to Steps 3 and 4.

### Step 3: Executive presentation

```
Generate the executive presentation based on the reviewed report.
Audience: executive | Format: html
```

The agent applies your annotations automatically: known issues become "resolved" items, unverified flags are suppressed, every problem shown has a solution attached.

### Step 4: Stakeholder view

```
Generate the stakeholder view.
Audience: stakeholder | Format: html
```

Cross-team focus: delivery trends, dependency blockers, shared risks. No team internals.

---

## Tips

- **Always start with Step 1.** The operational report is the source of truth. Skipping it means executive decks might surface unverified data.
- **Context carries forward.** What you provide in Step 2 automatically shapes Steps 3 and 4.
- **Quick check without full workflow:** Just run Step 1 with `projects: ALL` for a fast portfolio scan.
- **Re-run any step** with different parameters (different projects, different format) without restarting.
- **Format options:** `markdown` for text, `html` for slide decks (arrow keys to navigate, works offline), `pptx` for PowerPoint.

---

## Fact-Check Tags

The operational report includes confidence markers on alerts:

| Tag | Meaning | What to do |
|-----|---------|------------|
| 🔵 | High confidence — consistent trend | Review, likely real |
| 🟠 | Needs verification — single data point or outlier | Check source data before it reaches executive audience |

Executive reports **never** show 🟠 items. That's the point of the review step.

---

## Choosing projects

The agent matches your request to the CSV by exact or fuzzy project name, or infers groups from the data (e.g. same Business Unit) when unambiguous. If it can't tell which projects you mean, it will ask. No registry or config is required in the skill.

---

## Parking Lot

- [ ] SAFe metrics: PI Predictability, Feature cycle time, Program velocity — once data is available in the CSV
- [ ] BU-level rollups and cross-BU comparison for VP-level reporting
- [ ] Threshold tuning by project maturity
- [ ] DORA metrics — once deployment data is reliably captured
- [ ] NPS as Tier 2 — once consistently captured
- [ ] Automation: email/Slack delivery, lean web app, scheduled runs
