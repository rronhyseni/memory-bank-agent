# 🚀 Memory Bank Agent

**AI-Powered Project Memory for Cursor & Claude Desktop**  
Gives AI persistent memory of your project through structured documentation files. No more re-explaining your codebase every session.

## TL;DR Quickstart

1. **Clone once**: `cd ~ && git clone https://github.com/rronhyseni/memory-bank-agent.git`
2. **Install in project**:
   - Cursor: `cd /path/to/project && ~/memory-bank-agent/install`
   - Claude Code: `cd /path/to/project && ~/memory-bank-agent/install --claude`
3. **Restart your IDE** (Cursor: Cmd/Ctrl + Shift + P → "Developer: Reload Window")
4. **In chat, run**: `mb/init` → `mb/include` (Cursor/Claude slash commands, not terminal)
5. **Generate docs**: `mb/shape-project-brief`, `mb/shape-system-patterns`, etc.

Done. AI now reads `memory-bank/*.md` files automatically.

---

## Installation

### One-Time Setup

```bash
cd ~
git clone https://github.com/rronhyseni/memory-bank-agent.git
```

### Install in Your Project

Navigate to your project root and run:

```bash
~/memory-bank-agent/install
```

**Options:**

- `~/memory-bank-agent/install` - Install `.cursor/` folder (Cursor IDE, default)
- `~/memory-bank-agent/install --claude` - Install `.claude/` folder + `CLAUDE.md` (Claude Code)
- `~/memory-bank-agent/install --all` - Install both (for projects using both IDEs)

**What gets installed:**

- **Cursor**: `.cursor/` folder with commands, rules, and templates
- **Claude Code**: `.claude/` folder with commands + `CLAUDE.md` file (project root)

**After installation:**

1. **Restart your IDE**:
   - Cursor: Cmd/Ctrl + Shift + P → "Developer: Reload Window"
   - Claude Code: Restart or reopen the project

---

## How to Use (Cursor / Claude Chat)

After you run `~/memory-bank-agent/install` in your project and restart your IDE, you're ready to use Memory Bank.

- **Where to run commands**:  
  Use the **chat panel on the right** in Cursor or Claude Code – these are **slash commands**, not terminal commands.
- **See all commands**:  
  Click into chat and type `/` to see all available `mb/*` commands.
- **Quickstart flow** (recommended):
  1. In chat, run: `mb/init`
  2. Follow the prompts to generate all core `memory-bank/*.md` files
  3. Then run: `mb/include` in chat to activate the rules for the session
- **Shape-by-shape flow** (more control):
  - Run individual commands in chat: `mb/shape-project-brief`, `mb/shape-product-context`, `mb/shape-tech-context`, `mb/shape-system-patterns`
  - Use `mb/update-active-context` regularly while you work to keep the docs current

---

## Commands

| Command                    | What It Does                                                  |
| -------------------------- | ------------------------------------------------------------- |
| `mb/init`                  | Initialize memory-bank system (creates `memory-bank/` folder) |
| `mb/include`               | Activate memory bank rules for current session                |
| `mb/shape-project-brief`   | Generate project overview, goals, audience                    |
| `mb/shape-system-patterns` | Generate architecture, folder structure, conventions          |
| `mb/shape-tech-context`    | Generate stack, dependencies, setup instructions              |
| `mb/shape-product-context` | Generate features, UX patterns, business logic                |
| `mb/update-active-context` | Update current work, recent changes, next steps               |

Files are created/updated in `memory-bank/` folder. AI reads these automatically every session.

---

## What Gets Installed

**For Cursor (`--cursor` or default):**

```
your-project-root/
├── .cursor/
│   ├── commands/mb/     # Commands (mb/init, mb/shape-*, etc.)
│   ├── rules/           # Memory Bank rules (.mdc files)
│   └── templates/       # Template files for generating docs
```

**For Claude Code (`--claude`):**

```
your-project-root/
├── .claude/
│   └── commands/mb/     # Commands (mb/init, mb/shape-*, etc.)
└── CLAUDE.md            # Memory Bank rules (loaded automatically by Claude Code)
```

**For Both (`--all`):**

```
your-project-root/
├── .cursor/             # Cursor configuration
├── .claude/             # Claude Code configuration
└── CLAUDE.md            # Claude Code rules (project root)
```

**Note:** Templates are shared from `.cursor/templates/` and accessible by both environments.

---

## Git Setup

**Commit configuration files** to share with your team:

- `.cursor/` folder (for Cursor users)
- `.claude/` folder (for Claude Code users)
- `CLAUDE.md` file (required for Claude Code)

**Optional**: Add `memory-bank/` to `.gitignore` if you want to keep it personal:

```gitignore
memory-bank/
```

You can also commit `memory-bank/` to share project context with your team - it's up to you.

---

## Optional: Alias

Add to `~/.zshrc` or `~/.bashrc`:

```bash
alias mb-install="~/memory-bank-agent/install"
```

Then: `cd /path/to/project && mb-install --all`

---

## Why Use This?

- **Persistent Context**: AI remembers your project across sessions
- **Less Repetition**: Stop re-explaining patterns and architecture
- **Better Code**: AI follows your established conventions
- **Fast Onboarding**: New devs get context instantly

---

## How It Works

**Cursor IDE:**

- Rules are stored in `.cursor/rules/*.mdc` files
- Commands are in `.cursor/commands/mb/`
- Activated via `/include` command

**Claude Code:**

- Rules are stored in `CLAUDE.md` (project root) - automatically loaded
- Commands are in `.claude/commands/mb/`
- Activated via `/include` command

Both environments use the same `memory-bank/` folder structure and commands, making it easy to switch between IDEs or use both.

---

**License**: MIT  
**Works with**: Cursor IDE, Claude Code (other editors can reuse `.cursor/` / `.claude/` configs if supported)
