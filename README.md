# 🚀 Memory Bank Agent

**AI-Powered Project Memory for Cursor**  
Gives AI persistent memory of your project through structured documentation files.

## What It Does

Memory Bank Agent creates and maintains 5 key documentation files in your project:

- **project-brief.md** - Project overview, goals, and audience
- **system-patterns.md** - Architecture, folder structure, conventions
- **tech-context.md** - Stack, dependencies, setup instructions
- **product-context.md** - Features, UX patterns, business logic
- **active-context.md** - Current work, recent changes, next steps

AI automatically reads these files for context in every session, eliminating the need to re-explain your project structure and patterns.

## Installation

### Step 1: Clone to Your Home Directory (One Time)

```bash
cd ~
git clone https://github.com/rronhyseni/memory-bank-agent.git
```

> Replace `your-org` with your GitHub organization URL

### Step 2: Install in Your Project

**Navigate to your project's root folder** and run:

```bash
cd /path/to/your/project/root
~/memory-bank-agent/install
```

This copies the `.cursor/` folder with commands and rules into your project root.

**Installation Options:**

```bash
~/memory-bank-agent/install          # Install .cursor/ (default)
~/memory-bank-agent/install --cursor # Install .cursor/ explicitly
~/memory-bank-agent/install --claude  # Install .claude/ (for Claude Desktop)
~/memory-bank-agent/install --all    # Install both
```

### Step 3: Activate in Cursor

1. **Restart Cursor** (Cmd/Ctrl + Shift + P → "Developer: Reload Window")
2. Run these commands:
   ```
   mb/init
   mb/include
   ```

## Usage

### Generate Documentation

Run these slash commands - AI will ask 3-5 questions, then generate the docs:

```
mb/shape-project-brief
mb/shape-system-patterns
mb/shape-tech-context
mb/shape-product-context
```

Files are created in `memory-bank/` folder at your project root.

### Daily Workflow

- AI reads `memory-bank/*.md` automatically every session
- After completing work: `mb/update-active-context`
- When patterns change: re-run relevant `mb/shape-*` command

## What Gets Installed

```
your-project-root/
├── .cursor/
│   ├── commands/mb/          # Slash commands (mb/init, mb/shape-*, etc.)
│   └── rules/                # Memory Bank rules
└── memory-bank/              # Generated docs (AI reads these)
    ├── projectBrief.md
    ├── systemPatterns.md
    ├── techContext.md
    ├── productContext.md
    └── activeContext.md
```

## Recommended .gitignore

Add to your project's `.gitignore`:

```gitignore
# Memory Bank - personal context
memory-bank/
```

**Commit `.cursor/`** to share commands with your team.  
**Don't commit `memory-bank/`** - it's personal developer context.

## Optional: Add Alias

Add to `~/.zshrc` or `~/.bashrc`:

```bash
alias mb-install="~/memory-bank-agent/install"
```

Then use from any project root:

```bash
cd /path/to/project/root
mb-install --all
```

## Why Use This?

- **Persistent Context**: AI remembers your project across sessions
- **Less Repetition**: Stop re-explaining patterns and architecture
- **Better Code**: AI follows your established conventions
- **Fast Onboarding**: New devs get context instantly

---

**License**: MIT  
**Works with**: Cursor, Claude Desktop (with --claude or --all flag)
