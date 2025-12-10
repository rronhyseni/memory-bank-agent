# 🚀 Memory Bank Agent

**AI-Powered Project Memory for Cursor & Claude Desktop**  
Gives AI persistent memory of your project through structured documentation files. No more re-explaining your codebase every session.

## TL;DR Quickstart

1. **Clone once**: `cd ~ && git clone https://github.com/rronhyseni/memory-bank-agent.git`
2. **Install in project**: `cd /path/to/project && ~/memory-bank-agent/install`
3. **Restart Cursor**, then run: `mb/init` → `mb/include`
4. **Generate docs**: `mb/shape-project-brief`, `mb/shape-system-patterns`, etc.

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

- `~/memory-bank-agent/install` - Install `.cursor/` (default)
- `~/memory-bank-agent/install --claude` - Install `.claude/` (Claude Desktop)
- `~/memory-bank-agent/install --all` - Install both

This copies `.cursor/` (or `.claude/`) with commands and rules into your project.

**Restart Cursor** (Cmd/Ctrl + Shift + P → "Developer: Reload Window"), then run:

```
mb/init
mb/include
```

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

```
your-project-root/
├── .cursor/ (or .claude/)
│   ├── commands/mb/     # Commands (mb/init, mb/shape-*, etc.)
│   ├── rules/           # Memory Bank rules
│   └── templates/       # Template files for generating docs
```

---

## Git Setup

**Commit `.cursor/`** (or `.claude/`) to share commands and rules with your team.

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

**License**: MIT  
**Works with**: Cursor, Claude Desktop (other editors can reuse `.cursor/` / `.claude/` configs if supported)
