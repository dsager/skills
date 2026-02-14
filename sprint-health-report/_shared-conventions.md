# Shared Conventions

Common patterns and conventions used across all report templates. Reference this file to ensure consistency.

## Metric Labeling

Use plain language for metrics. Avoid internal jargon when a clearer term exists:
- "Sprint %" → **Delivery Rate** (completed vs planned story points)
- Keep standard SAFe terms (PI, ART) where the audience expects them

## Qualifier Patterns

Keep qualifiers under 5 words. Solution-oriented, not problem-focused:

| Status | Example | Note |
|--------|---------|------|
| ✅ | "82%" | No qualifier needed for healthy values |
| ⚠️ | "84% — recovery planned" | Show solution, not problem ("recovery planned" vs "dropped 8pp") |
| 🚨 | "50% — dep. blocked" | Indicate cause/solution, not severity ("dep. blocked" vs "critically low") |

## Emoji Usage

Consistent per conventions. Max 1 per line/cell. Functional only, never decorative.

| Emoji | Meaning | Usage Context |
|-------|---------|---------------|
| ✅ | Healthy / resolved | Status indicators, resolved items |
| ⚠️ | Watch / needs attention | Status indicators, items needing review |
| 🚨 | Alert / at risk | Status indicators, urgent items |
| 👍 | Positive highlight | Highlights section |
| 📈 | Improving trend | Trend indicators |
| 📉 | Declining trend | Trend indicators |
| ➡️ | Stable trend | Trend indicators |
| 🔵 | High confidence | Fact-check markers (all audiences) |
| 🟠 | Needs verification | Fact-check markers (operational only) |
| 🔒 | Security concern | Security-related items |
| 🎯 | Action item | Recommendations, next steps |

## Project Names

- Use project names **exactly as they appear in the CSV**
- No transformation or normalization in reports
- Group/ART labels come from user or context (no skill-maintained registry)

## Confidence Levels & Audience Filtering

| Level | Meaning | Operational | Executive | Stakeholder |
|-------|---------|-------------|-----------|-------------|
| 🔵 High confidence | Consistent trend (3+ sprints) or multi-metric corroboration | Show with full detail | Show with solution | Show if cross-team impact |
| 🟠 Needs verification | Single data point, first occurrence, magnitude outlier | Show with verify tag | **Omit** | **Omit** |

## Common Omissions by Audience

### Executive (`audience: executive`)
- 🟠 Unverified alerts
- Data quality issues / tooling problems
- Individual personal situations (e.g., mood drops with personal cause)
- Raw metric tables with all columns
- Sprint-level volatility detail (show trend line instead)
- Speculative root causes
- Resolved items marked in context annotations

### Stakeholder (`audience: stakeholder`)
- Team internals: mood details, code smells, individual coverage
- Data quality / tooling issues
- Individual personnel situations
- 🟠 Unverified alerts (resolve during review step first)
- Anything that doesn't have cross-team impact
