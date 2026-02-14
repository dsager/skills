# Operational Report Template

Use this structure for `audience: operational` reports.

---

## Single Project / Cluster Report

```markdown
# [Project/Cluster Name] — Sprint Health Report
**Date**: [date] | **Latest Sprint**: [title] ([dates]) | **Health**: ✅/⚠️/🚨 (score: x.xx)

## Metrics
| Metric | Tier | Value | vs Prev | Trend ([n] sprints) | Status | Confidence |
|--------|------|-------|---------|---------------------|--------|------------|
| Sprint % | T1 | 82% | +16pp | 📈 improving | ✅ | 🔵 |
| Critical Bugs | T1 | 0 | = | ➡️ stable | ✅ | 🔵 |
| Security Overdue | T1 | 4 | +4 | 📉 new | 🚨 | 🟠 VERIFY |
| ... | | | | | | |

## 👍 What's Going Well
- [Concrete observation backed by data]
- [...]

## 🚨 What Needs Attention
- [Issue with: what happened, why it matters, severity, confidence level]
- [If 🟠: "⚠️ Needs verification — [reason]"]
- [...]

## 🎯 Recommended Actions
1. [Specific action → tied to metric and data → owner hint]
2. [...]

## 💬 Follow-Ups

Action items for clarification, context, or resolution — directed at specific roles. Only include items where the report surfaces something that needs input. Skip roles with nothing actionable.

**Rules:**
- Each item: what to do, who to talk to, why (reference specific data)
- Route to the right role:
  - **Team Lead** → delivery, technical debt, capacity, sprint planning
  - **Product Owner** → scope/targets, priorities, backlog, stakeholder risks
  - **Agile Coach** → mood, process concerns, retrospective suggestions
- Include 🟠 verify items directed at whoever can confirm the data
- Keep items concise — one line each

**Format:**
1. [Action — what to discuss/verify] → [Role] ([data reference])
2. [...]

## 📋 Updated Sprint Health Log
*(Generated after the review step is complete — not in the initial report.)*

After the user has completed follow-ups and collected responses (Steps 3–4), auto-generate an updated sprint health log as a markdown code block. Follow the format and rules in the Sprint Health Log section of SKILL.md. The user saves this file for the next sprint cycle.

## Data Quality
- [Missing metrics, parsing issues, anomalies]
- [Fact-check exclusions: "Value X excluded — [reason]"]
- [Limited data warnings]
```

## Cluster Report (adds cross-team section)

After per-project sections, add:

```markdown
## Cross-Team Observations
- [Patterns shared across projects]
- [Dependency chains, infrastructure issues]
- [ART-level concerns]

## Top Actions This Sprint
| # | Priority | Action | Owner | Project |
|---|----------|--------|-------|---------|
| 1 | 🚨 | [action] | [owner] | [project] |
| 2 | ⚠️ | [action] | [owner] | [project] |
| ... | | | | |

## 💬 Follow-Ups
[Per-project action items directed at relevant roles. For cluster/portfolio-wide topics,
 group into single items rather than repeating per project.]

## 📋 Updated Sprint Health Log
[Generated after review step — see single project template for details.]
```

## Portfolio Report (`projects = ALL`)

```markdown
# Portfolio Health Report
**Date**: [date] | **Projects**: [count]

## Executive Summary
[2-3 sentences: distribution, biggest concern, trajectory]

## Health Overview
| Project | Health | Sprint % | Crit Bugs | Coverage | Mood | Top Risk |
|---------|--------|----------|-----------|----------|------|----------|
| [name] | 🚨 | 50% 📉 | 0 ✅ | 91% ✅ | 8.3 👍 | [one-liner] |
| ... sorted: 🚨 first, then ⚠️, then ✅ |

## 🚨 Projects At Risk
[Per project: issues + actions]

## ⚠️ Watch List
[Table: project, score, top concern, trend, suggested action]

## ✅ Healthy
[Compact list, note standouts]

## Data Quality Flags
[Missing mood → Agile Coach action, anomalies, parsing issues]

## 🎯 Top Actions
[Max 5, sorted by criticality]

## 💬 Follow-Ups
[Per-project action items directed at relevant roles, following the same rules as single-project reports.
 Group cross-cutting topics (e.g. portfolio-wide mood gaps, shared dependency blockers)
 into single items rather than repeating per project.]

## 📋 Updated Sprint Health Log
[Generated after review step — see single project template for details.]
```

---

## Guidelines

- Back every claim with a data point
- Show all confidence levels (🔵 and 🟠)
- Include fact-check exclusions in Data Quality section
- Use emoji consistently per the conventions in SKILL.md
- Project names exactly as they appear in the data
- Group or ART names as the user or context provides (no registry)
- End with "Ready for your review" to prompt Step 2
- After review is complete, auto-generate the updated sprint health log (see SKILL.md)
