# Skill Architecture

Overview of the skill's modular structure and how to use it efficiently.

## File Organization

The skill follows a separation-of-concerns approach with specialized reference files:

```
sprint-health-report/
├── SKILL.md                    # Main entry point - workflow & parameters
├── README.md                   # Quick start guide
├── _shared-conventions.md      # Common patterns across all audiences
├── _template-fragments.md      # Reusable formatting patterns
├── _data-reference.md          # Thresholds, scoring, heuristics
├── templates/
│   ├── operational-report.md   # Full detail report template
│   ├── executive-report.md     # Executive slide deck template
│   └── stakeholder-report.md   # Cross-team report template
└── examples/                   # Sample outputs
```

## Reading Path for Agents

**First time / Understanding the skill:**
1. Start with `SKILL.md` for workflow, parameters, and CSV schema
2. Check `_data-reference.md` for thresholds and scoring logic
3. Review `_shared-conventions.md` for emoji, labeling, and audience rules

**Generating a specific report:**
1. Reference the appropriate `templates/[audience]-report.md`
2. Apply patterns from `_template-fragments.md` for consistent formatting
3. Apply rules from `_shared-conventions.md` for qualifiers and omissions
4. Apply thresholds from `_data-reference.md` for health scoring

## Design Principles

1. **Single Source of Truth**: Each concept lives in one place
   - Emoji conventions → `_shared-conventions.md`
   - Health thresholds → `_data-reference.md`
   - Report structure → `templates/`

2. **Reference, Don't Duplicate**: Templates reference shared files instead of repeating content

3. **Compact & Scannable**: Reference files are small (63-85 lines each) for quick lookup

4. **Stable Base**: Common patterns in reference files provide consistency across all reports

## Token Efficiency

**Before optimization:**
- Agents scanned all templates to find conventions
- Duplication meant ~200 lines of repeated content
- Each template had its own version of rules

**After optimization:**
- Agents reference compact files (6.7KB total for all conventions)
- Rules defined once, referenced many times
- 21% reduction in main documentation
- Clearer boundaries between workflow, conventions, and templates

## Maintenance Benefits

**To update conventions** (emoji, labeling, qualifiers):
- Edit `_shared-conventions.md` once
- All templates automatically reflect the change

**To update thresholds or scoring**:
- Edit `_data-reference.md` once
- All reports use updated values

**To update report structure**:
- Edit specific template in `templates/`
- References to shared patterns remain valid
