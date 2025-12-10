# 🚀 Memory Bank Agent

**AI-Powered Project Memory for Cursor**  
Streamline codebase context with structured docs: `projectBrief.md`, `systemPatterns.md`, `techContext.md`, `productContext.md`, `active-context.md`.

Generates via slash commands (`/shape-*`) – AI infers from code, asks minimal Qs.

## 📦 Quick Install (Safe & Simple)

1. Clone this repo:

   ```bash
   git clone https://github.com/rronhyseni/memory-bank-agent.git
   cd memory-bank-agent
   ```

2. Install into **any project**:
   ```bash
   ./install.sh /path/to/your-project  # e.g., ./install.sh ~/Desktop/wave-app
   ```

✅ **Safe**: Adds shapes/rules to `.cursor/` **without overwriting** existing rules.md. Creates `memory-bank/` + stubs.

## 🎯 Usage in Cursor

1. **Restart Cursor** (reload rules: Cmd/Ctrl + Shift + P > "Cursor: Reload Rules").
2. **Generate docs**:

   ```
   /init
   /include
   /shape-project-brief
   /shape-system-patterns
   /shape-tech-context
   /shape-product-context
   /shape-active-context
   ```

   - Answer 3-5 Qs → AI generates full MD in `memory-bank/`.
   - Review/edit.

3. **Daily workflow**:
   - Read `memory-bank/*.md` for context.
   - Update `active-context.md` after tasks.
   - AI always uses these as persistent memory.

## 🛠️ What's Inside

```
.cursor/
├── shape-*.md     # Prompts for doc generation
└── rules.md       # Cursor rules (appended safely)

memory-bank/
├── projectBrief.md
├── systemPatterns.md
├── techContext.md
├── productContext.md
└── activeContext.md
```

## 🔧 Customize

- Edit `shape-*.md` for project-specific tweaks.
- Re-run `install.sh` anytime (idempotent).

## 🙌 License

MIT – Fork & adapt!

**Made for monorepos like NestJS/Next.js. Works anywhere!**

```

```
