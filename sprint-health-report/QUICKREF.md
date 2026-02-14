# Quick Reference Card

Essential patterns for generating reports efficiently.

## Common Commands

```
Analyze [project/group] from the attached CSV
→ Generates operational report (Step 1)

Generate executive presentation based on the reviewed report
→ Generates executive slides (Step 3)

Generate stakeholder view
→ Generates cross-team report (Step 4)
```

## File Quick Links

| Need | File |
|------|------|
| Workflow & parameters | [SKILL.md](SKILL.md) |
| Health thresholds & scoring | [_data-reference.md](_data-reference.md) |
| Emoji & labeling rules | [_shared-conventions.md](_shared-conventions.md) |
| Formatting patterns | [_template-fragments.md](_template-fragments.md) |
| Report structure | [assets/templates/](assets/templates/) |

## Essential Rules (Quick Lookup)

### Data Processing
- **European format**: `92,51 %` → 92.51
- **Sprints**: Only use completed sprints, skip in-progress
- **Trend minimum**: Need ≥3 completed sprints
- **Active projects**: Completed sprint within 60 days

### Health Scoring
- **Tiers**: T1 (3×) Critical | T2 (2×) Important | T3 (1×) Info
- **Status**: ✅=0, ⚠️=1, 🚨=2
- **Formula**: Weighted average (see [_data-reference.md](_data-reference.md))

### Audience Filters
- **Operational**: All data + fact-check tags (🔵 and 🟠)
- **Executive**: Solutions-first, no 🟠 items
- **Stakeholder**: Cross-team only, no 🟠 items

### Key Thresholds (Common Metrics)
- **Sprint %**: ✅ 75-115% | ⚠️ 60-75% or 115-140% | 🚨 <60% or >140%
- **Critical Bugs**: ✅ 0 | ⚠️ 1 | 🚨 ≥2
- **Test Coverage**: ✅ ≥85% | ⚠️ 75-85% | 🚨 <75%

### Fact-Check Actions
- **>3× spike or >5× portfolio median**: 🟠 VERIFY
- **Impossible values** (Coverage >100%, negatives): EXCLUDE
- **Consistent trend (3+ sprints)**: 🔵 high confidence

## Metric Labeling (Plain Language)

Use in executive/stakeholder reports:
- "Sprint %" → **Delivery Rate**
- Keep: PI, ART, sprint (standard SAFe terms)

## Qualifier Patterns

```
✅ "82%"                    (no qualifier needed)
⚠️ "84% — recovery planned" (solution-oriented)
🚨 "50% — dep. blocked"     (cause/solution, not severity)
```

Keep ≤5 words. Focus on solutions, not problems.

## Report Headers

**Single project:**
```markdown
# ProjectX — Sprint Health Report
**Date**: [date] | **Latest Sprint**: [title] ([dates]) | **Health**: ✅ (score: 0.15)
```

**Portfolio:**
```markdown
# Portfolio Health Report
**Date**: [date] | **Projects**: 12 active
```
