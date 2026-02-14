# Template Fragments

Reusable components for consistent report formatting. Reference these patterns in all reports.

## Health Badge Format

```
✅ HEALTHY | ⚠️ WATCH | 🚨 AT RISK
```

With score: `✅ (score: 0.15)` or `🚨 (score: 1.42)`

## Metric Table Row

```
| Metric Name | Tier | Value | vs Prev | Trend (n sprints) | Status | Confidence |
```

Example:
```
| Sprint % | T1 | 82% | +16pp | 📈 improving | ✅ | 🔵 |
```

## Card Layout (Executive/Stakeholder)

```
[Project Name] [Health Badge]
├─ Metric 1: emoji + value [+ qualifier]
├─ Metric 2: emoji + value [+ qualifier]
├─ Metric 3: emoji + value [+ qualifier]
└─ Metric 4: emoji + value [+ qualifier]
```

Example:
```
ProjectX ✅ HEALTHY
├─ ✅ 82%
├─ 🔒 0 overdue
├─ ✅ 91% coverage
└─ 👍 8.3 mood
```

## Trend Indicators

Format: `emoji direction`

```
📈 improving
📉 declining
➡️ stable
```

## Action Item Format

Numbered list with emoji, action, owner:

```
1. 🚨 [Action description] → [Owner/Role]
2. ⚠️ [Action description] → [Owner/Role]
3. 🎯 [Action description] → [Owner/Role]
```

## Report Header (Single Project)

```markdown
# [Project Name] — Sprint Health Report
**Date**: [date] | **Latest Sprint**: [title] ([dates]) | **Health**: [badge] (score: x.xx)
```

## Report Header (Portfolio)

```markdown
# Portfolio Health Report
**Date**: [date] | **Projects**: [count] active
```

## Key Message Format (Slides)

Max 2-3 sentences. Pattern:
1. Status statement
2. Top concern OR trajectory
3. (Optional) Forward action

Example:
> All teams recovering from holiday period. Security findings need attention across TeamA and TeamB. Remediation scheduled for next sprint.
