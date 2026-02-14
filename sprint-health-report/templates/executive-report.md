# Executive Slide Deck Template

Use this structure for `audience: executive` HTML slide decks. See [_template-fragments.md](../_template-fragments.md) for formatting patterns.

---

## Design Principles

- **One message per slide**
- **Scannable** — no walls of text
- **Bullets ≤5 per slide**, each ≤15 words
- **Graphs where possible** instead of tables
- **Every problem has a solution** attached
- Dark theme, clean layout, readable at projection size

## Conventions

See [_shared-conventions.md](../_shared-conventions.md) for:
- Emoji usage and visual anchors
- Metric labeling (e.g., Sprint % → Delivery Rate)
- Qualifier patterns (solution-oriented, ≤5 words)
- What to omit in executive view

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
Each card (see [_template-fragments.md](../_template-fragments.md) for format):
  - Project name + health badge (✅ HEALTHY / ⚠️ WATCH / 🚨 AT RISK)
  - 3-4 key metrics only: Delivery, Security, Coverage, Team
  - Each metric: emoji status + value + brief qualifier
  - Qualifiers per [_shared-conventions.md](../_shared-conventions.md)
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
