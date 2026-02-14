# Portfolio Health Report (Example)

**Date**: 15 February 2026 | **Projects**: 5 (active only: completed sprint in past 60 days) | **Report type**: Portfolio overview

---

## Executive Summary

All five active projects are in scope. One project is at risk (Pulse — delivery spike and open bugs), two need attention (Atlas — Sprint % in watch band; Depot — overcommit and coverage), and two are healthy (Nexus, Quest). The main focus is Pulse data verification and Depot planning calibration; Atlas should maintain focus on delivery consistency.

---

## Health Overview

| Project | Health | Sprint % | Crit Bugs | Open Bugs | Coverage | Mood | Top Risk |
|---------|--------|----------|-----------|-----------|----------|------|----------|
| Pulse | 🚨 | 231% 🟠 | 0 ✅ | 10 ⚠️ | 90% ✅ | 7.2 👍 | Sprint % spike → VERIFY; open bugs |
| Atlas | ⚠️ | 67% ⚠️ | 0 ✅ | 4 ✅ | 85% ✅ | 8.8 👍 | Sprint % below target |
| Depot | ⚠️ | 138% ⚠️ | 0 ✅ | 4 ✅ | 75% ⚠️ | 8.2 👍 | Overcommit; coverage watch |
| Nexus | ✅ | 75% ✅ | 0 ✅ | 0 ✅ | 85% ✅ | 10 👍 | — |
| Quest | ✅ | 94% ✅ | 0 ✅ | 2 ✅ | 87% ✅ | 7.5 👍 | — |

*Sorted: 🚨 first, then ⚠️, then ✅. Pulse Sprint % 231% flagged 🟠 VERIFY (magnitude spike vs history).*

---

## 🚨 Projects At Risk

| Project | Issues | Recommended actions |
|---------|--------|---------------------|
| **Pulse** | Sprint % 231% (113/49) is a large spike vs prior sprints; open bugs 10. | 🟠 **Verify** sprint completion and target data for last sprint before escalating. Triage open bugs; confirm no double-count or one-off release. |

---

## ⚠️ Watch List

| Project | Score | Top concern | Suggested action |
|---------|-------|-------------|------------------|
| Atlas | 0.33 | Sprint % 67% (below 75%) | Calibrate planning; aim for 75–115% next sprint. |
| Depot | 0.40 | Sprint % 138%, coverage 75% | Reduce overcommit; plan coverage improvement to ≥85%. |

---

## ✅ Healthy

- **Nexus** — Delivery 75%, zero critical/open bugs, coverage 85%, mood 10.
- **Quest** — Delivery 94%, 2 open bugs, coverage 87%, mood 7.5.

---

## Data Quality & Notes

- **Active filter**: Only projects with at least one completed sprint ending in the **past 60 days** (from report date) are included.
- **Pulse**: Sprint % 231% is a magnitude spike vs project history → 🟠 VERIFY (data or one-off delivery); excluded from portfolio-level delivery conclusions until confirmed.
- **Depot**: Test Coverage 768% in one sprint row excluded (impossible value); other Depot metrics from last completed sprint used.
- **European number format**: Sprint %, Test Coverage, Team Mood parsed with comma as decimal.
- Example data uses fictional project names (Atlas, Depot, Nexus, Pulse, Quest) and is for illustration only.

---

## 🎯 Top Actions

| # | Priority | Action | Project |
|---|----------|--------|---------|
| 1 | 🚨 | Verify Pulse last-sprint data; triage open bugs | Pulse |
| 2 | ⚠️ | Bring Sprint % into 75–115% band | Atlas |
| 3 | ⚠️ | Reduce overcommit and raise coverage toward 85% | Depot |

---

## 💬 Slack Drafts

### Pulse

#### Team Lead: [name]
> Hey [name], the Sprint 128 numbers for Pulse look unusual — delivery came in at 231% (113 completed vs 49 planned). Was that a bulk release or maybe a target that didn't get updated? Also, open bugs are sitting at 10 right now. Can you give me a quick read on both before I put this into the exec report?

#### Product Owner: [name]
> Hey [name], heads up on Pulse — there are 10 open bugs as of Sprint 128, up from where it was trending. Are any of these blocking or customer-facing? Want to make sure we're prioritising the right things for next sprint.

### Atlas

#### Team Lead: [name]
> Hey [name], Atlas came in at 67% delivery last sprint (33 of 49 points). That's a bit below the 75% we'd like to see. Is this a capacity thing or were some items harder than estimated? Just want to understand so we can calibrate the next sprint target.

### Depot

#### Team Lead: [name]
> Hey [name], two things on Depot:
> - Delivery was 138% last sprint (54 of 39 planned) — are we underestimating targets or pulling in extra work mid-sprint?
> - Test coverage dropped to 75%, which puts it in the watch zone. Any plan to bring that back up toward 85%?

#### Product Owner: [name]
> Hey [name], Depot has been running hot on delivery — 138% last sprint, and it's been over 100% a few times recently. Might be worth reviewing whether the sprint targets reflect actual capacity, so we get a cleaner picture of what the team can commit to.

*(Agile Coach: no process or mood concerns flagged this cycle — all teams reporting mood ≥7.2. Nexus and Quest are healthy with no actionable topics.)*
