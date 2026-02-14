# Stakeholder Report Template

Use this structure for `audience: stakeholder` reports. See [_template-fragments.md](../../_template-fragments.md) for formatting patterns.

---

## Focus

- Delivery predictability across teams
- Cross-team dependencies and blockers
- PI-level progress
- Shared risks and infrastructure concerns

## Tone

Collaborative. Frame issues as shared problems needing collective action, not team failures.

## Conventions

See [_shared-conventions.md](../../_shared-conventions.md) for:
- Metric labeling (e.g., Sprint % → Delivery Rate)
- Qualifier patterns (solution-oriented, ≤5 words)
- What to omit in stakeholder view

---

## Slide Structure (HTML)

### Slide 1: Title
```
[LABEL] Stakeholder Status Report
[H1]    [Group / BU / ART Name]
[SUBTITLE] [team names]
[META]  Date | PI Phase
[KEY MESSAGE] 2 sentences: delivery status + top cross-team item
```

### Slide 2: Project Health
```
[H2] Project Health
[SUBTITLE] Delivery rate — story points completed vs planned (last [n] sprints)

[Card grid, one per project]
Each card:
  - Project name (colored) + health badge (✅ HEALTHY / ⚠️ WATCH / 🚨 AT RISK)
  - SVG sparkline area as card background:
    - Filled area chart of delivery rate over trend window
    - Gradient fill matching health status color (green=healthy, yellow=watch, red=risk), subtle opacity
    - Sparkline stroke slightly more visible than fill
  - 3-4 key metric rows: Delivery, Quality, Security
    - Each: label + value + brief qualifier (per [_shared-conventions.md](../../_shared-conventions.md))
```

### Slide 3: Dependencies & Blockers
```
[H2] Dependencies & Blockers

[Cards or list]
Each blocker:
  - Affected team(s)
  - Dependency source (external team, platform, infra)
  - Impact: what's blocked, how many sprints affected
  - Status: resolution path + timeline

Example:
  🚨 Team A blocked by [external dependency] integration
     Impact: 3 sprints at <50% delivery
     Status: Escalating to coordination
```

### Slide 4: Shared Risks
```
[H2] Shared Risks

[Items that affect multiple teams]
  - Security findings appearing across teams → platform-level scan?
  - Zero deployment tracking → measurement gap
  - Planning maturity: high delivery rate variance across teams
```

### Slide 5: Actions & Asks
```
[H2] 🎯 Actions & Asks

[Max 4 items, framed as group-level asks]
  - "Establish dependency coordination for [blocker]"
  - "Platform team to clarify security scan scope"
  - Not: "Team X needs to fix their coverage"

[KEY MESSAGE] Forward-looking, collaborative
```

---

## Markdown Structure

```markdown
# [Group Name] — Delivery Report
**Date**: [date] | **PI Phase**: [phase] | **Teams**: [count]

## Project Health
| Team | Delivery Rate | Trend | Quality | Security | Status |
|------|---------------|-------|---------|----------|--------|
| [name] | 82% | 📈 | ✅ 0 crit | ✅ 0 overdue | ✅ On track |
| ... |

## Dependencies & Blockers
- 🚨 [Blocker description] → [affected teams] → [status/resolution]
- ...

## Shared Risks
- [Risk affecting multiple teams + impact]
- ...

## 🎯 Actions
1. [Group-level action + owner]
2. [...]
```
