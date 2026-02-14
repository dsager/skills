# Operational Report Template

Use this structure for `audience: operational` reports. See [_template-fragments.md](../../_template-fragments.md) for formatting patterns.

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
```

See [_template-fragments.md](../../_template-fragments.md) for metric table format.

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
```

---

## Guidelines

- Back every claim with a data point
- Show all confidence levels (🔵 and 🟠)
- Include fact-check exclusions in Data Quality section
- See [_shared-conventions.md](../../_shared-conventions.md) for emoji usage, metric labeling, and project naming
- End with "Ready for your review" to prompt Step 2
