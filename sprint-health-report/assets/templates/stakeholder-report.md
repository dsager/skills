# Stakeholder Report Template

Use this structure for `audience: stakeholder` reports.

---

## Focus

- Delivery predictability across teams
- Cross-team dependencies and blockers
- PI-level progress
- Shared risks and infrastructure concerns

## What to Omit

- Team internals: mood details, code smells, individual coverage
- Data quality / tooling issues
- Individual personnel situations
- Unverified (🟠) alerts — these should be resolved during the review step (Step 2) before reaching stakeholder level. If an item is still unresolved, exclude the affected metric from aggregate numbers and note briefly why (e.g. "one project excluded pending data confirmation").

## Tone

Collaborative. Frame issues as shared problems needing collective action, not team failures.

## Language

Use plain language for metrics. Avoid internal jargon when a clearer term exists:
- "Sprint %" → **Delivery Rate** (completed vs planned story points) — label charts and tables accordingly
- Keep standard SAFe terms (PI, ART) where the audience expects them

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
    - Each: label + value + brief qualifier (under 5 words, solution-oriented)
  - Qualifiers follow executive template conventions:
    ✅ "82%"                     (no qualifier needed)
    ⚠️ "67% — recovering"       (not "dropped 11pp")
    🚨 "50% — dep. blocked"     (not "critically low")
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
