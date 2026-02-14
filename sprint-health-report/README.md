# Sprint Health Report

A skill that analyzes sprint-level CSV data and generates project health reports for status meetings.

**Quick reference:** [QUICKREF.md](QUICKREF.md) — Essential patterns, thresholds, commands for fast lookup.

**Full spec & workflow:** [SKILL.md](SKILL.md) — parameters, CSV schema, workflow.

**Reference files:**
- [_shared-conventions.md](_shared-conventions.md) — Emoji, labeling, qualifiers, audience filters
- [_template-fragments.md](_template-fragments.md) — Reusable patterns for badges, tables, cards
- [_data-reference.md](_data-reference.md) — Thresholds, scoring, heuristics, validation rules

---

## Quick Start

1. Attach your sprint CSV
2. Tell the agent what you want:

```
Analyze the attached CSV for my [project or group] teams.
```

The agent resolves project names by exact or fuzzy match against the CSV. Examples:
- "give me the report for [ProjectA] and [ProjectB]"
- "portfolio overview" / "all projects"
- "all teams in [Business Unit]" (when CSV supports it)

---

## Workflow Summary

See [SKILL.md](SKILL.md#suggested-workflow) for full workflow details. Quick summary:

1. **Operational Report** — Full analysis with fact-check tags (🔵/🟠)
2. **Review** — Add context and corrections
3. **Executive Report** — Solutions-first, presentation-ready
4. **Stakeholder Report** — Cross-team view (optional)

**Always start with Step 1.** Your feedback carries forward automatically.

---

## Tips

- **Always start with Step 1** (operational report is source of truth)
- **Context carries forward** — feedback in Step 2 shapes Steps 3 & 4
- **Quick portfolio scan**: Step 1 with `projects: ALL`
- **Format options**: `markdown` (text), `html` (slide decks, arrow keys to navigate), `pptx` (PowerPoint)

---

## Fact-Check Tags

| Tag | Meaning | Action |
|-----|---------|--------|
| 🔵 | High confidence — consistent trend | Review, likely real |
| 🟠 | Needs verification — outlier | Check source data before executive view |

Executive reports **never** show 🟠 items (resolved in review step).

---

## Parking Lot

Ideas and enhancements under consideration.

### Metrics & Features
- [ ] SAFe metrics: PI Predictability, Feature cycle time, Program velocity
- [ ] "vs. last report" delta mode
- [ ] Per-BU rollups for VP-level reporting
- [ ] Multi-BU aggregate reporting — compare health across business units for executive-level views
- [ ] Threshold tuning by project maturity
- [ ] DORA metrics once deployment data is reliable
- [ ] NPS as Tier 2 when consistently captured
- [ ] Group auto-detection from BU + sprint cadence (no registry)
- [ ] Automation: email/Slack delivery, lean web app, scheduled runs

### Scripts (optional helpers)
- [ ] **CSV Preprocessor** — Convert European number format to standard format (`92,51 %` → `92.51%`), normalize dates, strip NBSP characters. Would eliminate manual preprocessing step.
- [ ] **CSV Validator** — Check required columns, validate data types, identify in-progress sprints, flag suspicious values (coverage >100%, negatives). Provides early error detection.
- [ ] **Threshold Calculator** — Analyze historical CSV data to suggest custom thresholds based on percentiles/distributions per project or portfolio. Data-driven threshold tuning.
