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

## 💬 Slack Drafts

Draft messages for relevant roles based on the report findings. Only include a message for a role when the report contains topics that need their input. Skip roles with nothing actionable.

**Rules:**
- One message per role per project (or per cluster/portfolio for cross-cutting topics)
- Casual, direct tone — like a real Slack DM between colleagues
- Reference specific data points from the report (metric, value, sprint)
- State clearly what you need: clarification, context, confirmation, or action
- Keep each message short — 2-4 sentences max, no walls of text
- Group multiple topics for the same role into one message with bullet points
- Include 🟠 verify items directed at whoever can confirm the data
- Never include health scores or internal jargon — use plain language

**Role routing:**
- **Team Lead** → delivery issues (Sprint %, velocity swings), technical debt (code smells, coverage drops), team capacity, sprint planning concerns
- **Product Owner** → scope/target questions, priority trade-offs, backlog concerns, stakeholder-facing risks
- **Agile Coach** → mood drops, process concerns (mood = 0 tracking gaps), retrospective suggestions, cross-team patterns

### [Role]: [Person/placeholder]
> Hey [name], [casual opener about the topic].
> [Specific ask with data reference].
> [Optional: what you'll do with their answer, or next step].

*(Repeat per role as needed. Omit roles with no actionable topics.)*

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

## 💬 Slack Drafts
[Per-project messages to relevant roles. For cluster-wide topics (shared dependencies,
 ART-level concerns), group into single messages rather than repeating per project.]
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

## 💬 Slack Drafts
[Per-project messages to relevant roles, following the same rules as single-project reports.
 Group cross-cutting topics (e.g. portfolio-wide mood gaps, shared dependency blockers)
 into separate messages rather than repeating per project.]
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
