# Using the sprint-health-report skill on other platforms

This doc covers **use cases**, **install**, and **usage** for the sprint-health-report skill on Cursor, VS Code + GitHub Copilot, Claude (claude.ai and Claude Code), ChatGPT, and Microsoft 365 Copilot. The skill follows the [AgentSkills.io](https://agentskills.io) format (directory with `SKILL.md`, optional `templates/`, `examples/`).

## Get the skill

1. **Release zip** (single skill): [Releases](https://github.com/dsager/skills/releases) — download e.g. `sprint-health-report-v1.0.zip`.
2. **Source zip** (whole repo): [main.zip](https://github.com/dsager/skills/archive/refs/heads/main.zip) — extract the `sprint-health-report` folder.
3. **Clone**: `git clone https://github.com/dsager/skills.git` — use the `sprint-health-report` folder.

Then: **Install** (platform-specific, below), **provide your sprint CSV**, and use a **first prompt** like: *"Analyze the attached CSV for [project name or portfolio]. Audience: operational, format: markdown."*

---

## When to use this skill

| Platform | Best use case |
|----------|----------------|
| **Cursor** | Primary: CSV in project or pasted; ask for "operational report for project X" or "portfolio overview". Agent auto-applies the skill. Full 4-step workflow (operational → review → executive → stakeholder) with templates. |
| **VS Code + GitHub Copilot** | Same workflow; skill is not auto-discovered. You add the skill text to repo instructions and attach CSV in chat. Best for "report from this repo's CSV". |
| **Claude (claude.ai)** | Use a **Project**: add skill content as project instructions and upload or paste CSV. Good for one-off or recurring status reports without a local repo. |
| **Claude Code** | Clone repo or add skill to project; CSV in workspace. In-editor chat with full skill context. |
| **ChatGPT** | **Projects** (Plus/Team/Pro): project instructions = condensed skill; upload or paste CSV per conversation. Good for ad-hoc reports and sharing with stakeholders. |
| **Microsoft 365 Copilot** | No native skill install. Paste CSV and a short report prompt into Word or Outlook and ask Copilot to analyze. |

---

## Cursor

- **Use case**: Full workflow in-IDE; agent discovers the skill from `.cursor/skills/` or `~/.cursor/skills/`.
- **Install**: Copy the `sprint-health-report` folder (containing `SKILL.md`, `README.md`, `templates/`, optionally `examples/`) into:
  - **Project**: `<your-project>/.cursor/skills/sprint-health-report`
  - **Global**: `~/.cursor/skills/sprint-health-report`
- **Usage**: Put your CSV in the project or paste it in chat. Ask e.g. *"Analyze the attached CSV for project Nexus. Audience: operational, format: markdown."* See [sprint-health-report/README.md](../sprint-health-report/README.md) for the full 4-step workflow.

**Quick start**: 1) Download zip → extract `sprint-health-report`. 2) Copy into `.cursor/skills/`. 3) Attach or paste CSV. 4) *"Analyze the attached CSV for [projects]. Audience: operational."*

---

## VS Code + GitHub Copilot

- **Use case**: Report from this repo's CSV; Copilot chat sees repo instructions and attached CSV.
- **Install**: Copilot does not discover `SKILL.md` automatically. Add the skill to the repo so chat can use it:
  - **Option A**: Create `.github/copilot-instructions.md` and paste a concise version of the skill (workflow, parameters, audiences, and that you want reports per [SKILL.md](../sprint-health-report/SKILL.md)). You can link to the full spec: *"When the user asks for a sprint health report, follow the sprint-health-report skill: see `sprint-health-report/SKILL.md` in this repo."*
  - **Option B**: Add a project-level `.instructions.md` (if you use path-specific instructions) that references or embeds the same.
  - **Option C**: Keep the skill folder in the repo and in your first message tell Copilot: *"Use the instructions in sprint-health-report/SKILL.md and templates for this report."*
- **Usage**: Open Copilot chat, attach your CSV, and request the report (e.g. *"Analyze the attached CSV for portfolio. Audience: operational, format: markdown."*).

**Quick start**: 1) Clone repo or add `sprint-health-report` to your repo. 2) Add skill summary or reference to `.github/copilot-instructions.md`. 3) Attach CSV in chat. 4) *"Analyze the attached CSV for [projects]. Audience: operational."*

---

## Claude (claude.ai)

- **Use case**: One-off or recurring status reports without a local repo; everything in a Project.
- **Install**: There is no folder-based skill install. Create a **Project** (Plus or team plan):
  - In the project, add **project instructions** that include the skill: paste the key parts of `SKILL.md` (workflow, parameters, audiences, fact-check rules, thresholds) or a condensed version. You can also upload `SKILL.md` and the templates as project files and say in instructions: *"When the user asks for a sprint health report, follow SKILL.md and the templates."*
- **Usage**: In a chat in that project, upload your CSV or paste it, then ask e.g. *"Analyze the attached CSV for portfolio. Audience: operational, format: markdown."*

**Quick start**: 1) Download the skill zip; unzip. 2) Create a Project and add skill content to project instructions (or upload SKILL.md). 3) Upload or paste CSV in a chat. 4) *"Analyze the attached CSV for [projects]. Audience: operational."*

---

## Claude Code

- **Use case**: Full skill in your workspace; CSV on disk; in-editor chat.
- **Install**: Clone the repo or extract the `sprint-health-report` folder into your project. Ensure the agent sees the skill: e.g. in `CLAUDE.md` (or project context) mention that the sprint-health-report skill in `sprint-health-report/SKILL.md` should be used when the user asks for sprint health reports.
- **Usage**: Put your CSV in the workspace (or paste in chat). In chat, ask e.g. *"Analyze the CSV in [path] for project X. Audience: operational, format: markdown."*

**Quick start**: 1) Clone repo or copy `sprint-health-report` into project. 2) Reference the skill in CLAUDE.md or project context. 3) Add CSV to workspace. 4) *"Analyze [CSV file] for [projects]. Audience: operational."*

---

## ChatGPT

- **Use case**: Ad-hoc reports and sharing with stakeholders; no IDE required.
- **Install**: **Projects** (Plus, Team, or Pro). Create a project and set **project instructions** to a condensed version of the skill: workflow (operational → review → executive → stakeholder), parameters (`projects`, `audience`, `format`), and that reports are generated from sprint-level CSV. You can paste the key sections of `SKILL.md` or a one-page summary (e.g. from [sprint-health-report/QUICK-START.md](../sprint-health-report/QUICK-START.md)).
- **Usage**: In a conversation in that project, upload your CSV or paste it, then ask e.g. *"Analyze the attached CSV for portfolio. Audience: operational, format: markdown."*

**Quick start**: 1) Create a Project. 2) Add condensed skill (workflow, parameters, audiences) to project instructions. 3) Upload or paste CSV in a new chat. 4) *"Analyze the attached CSV for [projects]. Audience: operational."*

---

## Microsoft 365 Copilot

- **Use case**: No native skill install. Use Copilot in Word or Outlook with pasted data and prompt.
- **Install**: None. You do not install the skill.
- **Usage**: In Word or Outlook, paste your sprint CSV and a short request, e.g. *"Generate an executive summary of project health from the table below. Focus on: delivery (sprint %), critical bugs, security overdue, test coverage, team mood. Flag risks and suggest one action per problem. Use the data only from the pasted table."* Optionally paste a one-paragraph "rules" summary (e.g. from [QUICK-START.md](../sprint-health-report/QUICK-START.md)) so Copilot follows similar conventions.

**Quick start**: 1) No install. 2) Paste CSV into a document. 3) Add the prompt above (and optionally the rules paragraph). 4) Ask Copilot to analyze.

---

## First prompt (any platform)

After installing and providing your CSV:

- **Operational report (recommended first step):**  
  *"Analyze the attached CSV for [project name(s) or 'portfolio' / 'ALL']. Audience: operational. Format: markdown."*
- **Portfolio quick scan:**  
  *"Analyze the attached CSV for all projects. Audience: operational."*

Then follow the workflow in [sprint-health-report/README.md](../sprint-health-report/README.md): review the operational report, add context, then ask for executive or stakeholder reports if needed.
