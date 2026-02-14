# Executive Slide Deck Template

Use this structure for `audience: executive` HTML slide decks.

---

## Design Principles

- **One message per slide**
- **Scannable** — no walls of text
- **Bullets ≤5 per slide**, each ≤15 words
- **Graphs where possible** instead of tables
- **Every problem has a solution** attached
- **Consistent emoji** as visual anchors (see SKILL.md)
- Dark theme, clean layout, readable at projection size

## Language

Use plain language for metrics. Avoid internal jargon when a clearer term exists:
- "Sprint %" → **Delivery Rate** (completed vs planned story points) — label charts and tables accordingly
- Keep standard SAFe terms (PI, ART) where the audience expects them

## Slide Structure

### Slide 1: Title
```
[LABEL] Executive Status Report
[H1]    [Cluster/Project Name]
[META]  Date | BU | Phase (e.g., "Mid-PI, post-holiday recovery")
[KEY MESSAGE] 2 sentences max. Overall status + single top takeaway.
```

### Slide 2: Project Health
```
[H2] Project Health

[3-column card grid, one per project]
Each card:
  - Project name + badge (✅ HEALTHY / ⚠️ WATCH / 🚨 AT RISK)
  - 3-4 key metrics only: Delivery, Security, Coverage, Team
  - Each metric: emoji status + value + brief qualifier
  - e.g., "✅ 82%" or "🔒 4 overdue — scheduled"

Keep qualifiers under 5 words. Solution-oriented:
  ✅ "82%"            (no qualifier needed)
  ⚠️ "84% — recovery planned"  (not "dropped 8pp")
  🚨 "50% — dep. blocked"      (not "critically low")
```

### Slide 3: Delivery Trajectory
```
[H2] Delivery Trajectory
[SUBTITLE] Delivery rate — story points completed vs planned (last [n] sprints)

[3-column chart grid]
Each chart:
  - Project name + trend emoji (📈/📉/➡️)
  - SVG sparkline showing delivery rate over trend window
  - Threshold lines at 75% and 115%
  - Color-coded dots (green/yellow/red per threshold)
  - Latest value labeled
  - One-line note below (e.g., "S13 = holiday sprint")
```

### Slide 4: Risks & Mitigations
```
[H2] Risks & Mitigations

[2-column layout]
Left: 🎯 ACTIVE (items needing work)
  - Each: emoji tag + project name + one sentence with solution
  - e.g., 🔒 Team A + Team B — Security spike. Remediation next sprint.

Right: ✅ RESOLVED / EXPECTED
  - Each: 👍 tag + topic + one sentence
  - e.g., 👍 Holiday dips — Seasonal. All teams recovering.
```

### Slide 5: Next Steps
```
[H2] 🎯 Next Steps

[Action list, max 4 items]
Each:
  - Number + emoji + action (one sentence) + owner
  - e.g., 1. 🔒 Security remediation for Team A + Team B. → Security lead

[KEY MESSAGE] 2-3 sentence summary. Confident, forward-looking.
```

---

## HTML Structure Notes

- Single self-contained HTML file, no external dependencies (except Google Fonts)
- CSS-based slide switching: `display: none/flex`, toggled by JS
- Arrow key + click navigation
- Progress bar (top) + slide number (bottom)
- Print-friendly: `@media print` shows all slides
- Consistent slide height: use `flex: 1; align-content: center` for content areas
- Embedded SVG for charts (no JS charting libraries needed)

## What to Omit in Executive View

- 🟠 Unverified alerts (fact-check filtered)
- Data quality issues / tooling problems
- Individual personal situations (mood drops with personal cause)
- Raw metric tables with all columns
- Sprint-level volatility detail (show trend line instead)
- Speculative root causes
- Anything that has a context annotation marking it as resolved
