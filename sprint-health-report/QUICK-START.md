# Sprint Health Report — quick reference

One-page reference for use on any platform. Full spec: [SKILL.md](SKILL.md). Workflow and tips: [README.md](README.md).

## Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `projects` | `ALL` | Project name(s), group, or `ALL` for portfolio. Natural language OK. |
| `audience` | `operational` | `operational` · `executive` · `stakeholder` |
| `format` | `markdown` | `markdown` · `html` · `pptx` |
| `trend_window` | `4` | Completed sprints for trend analysis |
| `report_date` | today | Report header date |

## Audiences

- **operational** — Full detail, all metrics, fact-check tags (🔵/🟠). Generate this first.
- **executive** — Solutions-first, no unverified alerts. Use after review step.
- **stakeholder** — Cross-team focus, dependencies. Omit team internals.

## Example prompt (copy-paste)

After attaching or pasting your sprint CSV:

```
Analyze the attached CSV for [project name or "portfolio" / "ALL"].
Audience: operational. Format: markdown.
```

Examples: *"Analyze the attached CSV for Nexus and Pulse. Audience: operational."* · *"Analyze the attached CSV for portfolio. Audience: operational."*

## Workflow in one line

1. Operational report → 2. You review and add context → 3. Executive report (optional) → 4. Stakeholder report (optional).

## Rules paragraph (for paste-in-doc use, e.g. M365 Copilot)

When the tool has no skill file, you can paste this as context:

*"Sprint health report: Use only the attached/pasted CSV. One row per sprint per project. European numbers (comma = decimal). Ignore unfinished sprints. Report health from: Sprint %, Critical Bugs, Open Bugs, Test Coverage, Team Mood, Cycle Time, Security Overdue. Healthy = green, watch = amber, at risk = red. Lead with solutions for executives; for operational audience include all flags and verification tags. Use project names exactly as in the CSV."*
