# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a collection of agent skills following the [AgentSkills.io](https://agentskills.io) standard. Skills are portable across any agent host that supports the format (Claude, Cursor, etc.).

Currently contains one skill: **sprint-health-report**.

## Structure

Each skill lives in its own directory with a required `SKILL.md` entry point, plus optional `templates/` and `examples/` subdirectories. There is no build system, package manager, or test suite — skills are prompt-based specifications (markdown files), not executable code.

## sprint-health-report

Analyzes sprint-level CSV data and generates project health reports for status meetings. The skill defines a structured 4-step workflow: Operational report → Review → Executive report → Stakeholder report.

Key files:
- `sprint-health-report/SKILL.md` — Full spec: parameters, CSV schema, health thresholds, scoring logic, fact-check rules
- `sprint-health-report/templates/` — Output templates per audience (operational, executive, stakeholder)
- `sprint-health-report/examples/` — Sample CSV input and generated reports (report date: 15 Feb 2026, fictional projects: Pulse, Nexus, Atlas, Depot, Quest)

### Important design decisions

- CSV uses **European number format** (comma = decimal, e.g. `92,51 %`)
- **Unfinished sprints are excluded** — the latest sprint row may be in-progress; only completed sprints are used for scoring and trends
- Health scoring uses **3-tier weighted metrics** (T1 Critical 3×, T2 Important 2×, T3 Informational 1×)
- **Fact-check system** with confidence levels: 🔵 (high confidence) shown to all audiences, 🟠 (needs verification) shown only in operational reports, never in executive reports
- Portfolio reports include only **active projects** (completed sprint within past 60 days)
