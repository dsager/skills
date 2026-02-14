# Data Reference

Quick reference for thresholds, rules, and heuristics. Calibrated for typical agile portfolios.

## Health Thresholds (Absolute)

| Metric | ✅ Healthy | ⚠️ Watch | 🚨 Alert |
|--------|-----------|----------|----------|
| Sprint % | 75–115% | 60–75% or 115–140% | <60% or >140% |
| Critical Bugs | 0 | 1 | ≥2 |
| Open Bugs | ≤5 | 6–15 | >15 |
| Test Coverage | ≥85% | 75–85% | <75% |
| Team Mood | ≥7.5 | 6.0–7.5 | <6.0 |
| Cycle Time | ≤5d | 5–10d | >10d |
| Security Overdue | 0 | 1–3 | >3 |
| Code Security | 0 | 1–3 | >3 |

## Trend Escalation Rules

| Condition | Effect |
|-----------|--------|
| Any metric >20% drop sprint-over-sprint | Escalate +1 level |
| Team Mood ≥1.5pt drop | Auto-🚨 |
| Test Coverage ≥3pp drop | ⚠️ minimum |
| Sprint % >40pp swing | ⚠️ (unstable) |
| Open Bugs net +5 | Escalate +1 level |
| Code Smells +30% | ⚠️ minimum |

## Scoring Formula

`✅=0  ⚠️=1  🚨=2`

**Score** = Σ(status × tier_weight) / Σ(tier_weight for reported metrics)

| Score | Health |
|-------|--------|
| 0.0–0.3 | ✅ Healthy |
| 0.3–0.8 | ⚠️ Needs Attention |
| 0.8+ | 🚨 At Risk |

**Overrides**: T1 metric at 🚨 → project 🚨. ≥3 metrics at ⚠️ → project ⚠️ minimum.

## Built-in Heuristics

| Pattern | Handling |
|---------|----------|
| Holiday sprints (mid-Dec–Jan, Aug) | Note "holiday period", don't alarm |
| IP/Innovation sprints | Exclude from velocity trend |
| Ramp-up (first 3-4 sprints) | Relax Sprint % to 60-115% |
| Zero deployments (all sprints) | Flag once: "tracking may not be configured" |
| Team Mood = 0 (≥2 sprints) | "Action: Agile Coach to review processes" |

## Fact-Check Validation

| Check | Rule | Action |
|-------|------|--------|
| Magnitude spike | >3× project max | 🟠 VERIFY |
| Sudden appearance | 0/empty 3+ sprints then spike | 🟠 VERIFY |
| Impossible value | Coverage >100%, Sprint % >300%, negatives | EXCLUDE |
| Cross-project outlier | >5× portfolio median | 🟠 VERIFY |
| Completeness | >50% metrics empty | 🟠 VERIFY |
