# skills

A collection of agent skills following the [AgentSkills.io](https://agentskills.io) standard — portable across any host that supports the format (Claude, Cursor, etc.).

## Skills

| Skill | Description |
|-------|-------------|
| [sprint-health-report](sprint-health-report/) | Analyze sprint-level CSV data and generate project health reports for status meetings. Supports multiple audiences (TD, management, ART/stakeholders) and output formats (markdown, HTML slides, PPTX). |

## Install

Download [Releases](https://github.com/dsager/skills/releases) (e.g. `sprint-health-report-v1.0.zip`) or [source zip](https://github.com/dsager/skills/archive/refs/heads/main.zip).

See [INSTALL](docs/INSTALL.md) for VS Code Copilot, Claude, ChatGPT, and Microsoft 365 Copilot.

## Using this skill elsewhere

| Platform | Use case |
|----------|----------|
| **Cursor** | Full workflow in-IDE; CSV in project or pasted; agent auto-applies skill from `.cursor/skills/`. |
| **VS Code + GitHub Copilot** | Repo-based instructions + chat; attach CSV and request report. |
| **Claude (claude.ai / Claude Code)** | Projects + instructions + CSV; or clone repo and use in workspace. |
| **ChatGPT** | Projects (Plus/Team/Pro): project instructions + upload/paste CSV per conversation. |
| **Microsoft 365 Copilot** | Paste CSV and a short report prompt into Word or Outlook; no skill install. |

Full install and usage steps per platform: [docs/INSTALL.md](docs/INSTALL.md).

## License

This work is licensed under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/).
