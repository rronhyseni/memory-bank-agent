---
description: Initialize the memory-bank system by creating all core documentation files
output: memory-bank/*.md
---

# Memory Bank Rules for AI (Cursor & Claude Code)

## Overview

This file defines a persistent memory system using Markdown files in `memory-bank/` to provide AI with structured, updatable context. Files follow a hierarchy: foundational (`project-brief.md`) informs others. Use slash commands for automation. Best practices: Keep files concise, update dynamically, validate often to reduce hallucinations.

**Cross-platform:** Works with both Cursor (`.cursor/`) and Claude Code (`.claude/`) environments.

## Core Files

- `projectBrief.md`: High-level scope, goals, requirements.
- `productContext.md`: Users, problems, UX journeys.
- `systemPatterns.md`: Architecture, patterns, decisions.
- `techContext.md`: Stack, dependencies, constraints.
- `activeContext.md`: Current tasks, notes.
- `progress.md`: Logs of done/pending.

Always generate in Markdown with # Main Sections, ## Subsections, **Bold Keys**, numbered/bulleted lists. Reference other files for consistency.

## Global Instructions

- Load `memory-bank/` files in every response where relevant.
- Use agent mode (e.g., PLAN for shaping, IMPLEMENT for updates).
- If input is vague, probe with follow-ups.
- Validate outputs: Check for completeness, no redundancies, alignment across files.
- Handle errors: If directory missing, create it.

## Command: /init

When triggered:

1. **Initial Response**:

   - Respond: "Initializing memory-bank. I'll guide you through creating all core documentation files with minimal questions."
   - Create `memory-bank/` directory if it doesn't exist.

2. **Global Quick-Start Questions** (Ask these first, one at a time):

   These answers will be reused across all shape commands to avoid duplicate questions:

   - **Q1**: "What's your project name?"
   - **Q2**: "What does your project do in one sentence?"
   - **Q3**: "What's your core tech stack? (e.g., 'Next.js + Node.js + PostgreSQL' or 'React + Django + MySQL')"
   - **Q4**: "What's your architecture type? (e.g., 'Monorepo', 'Monolith', 'Microservices', 'Serverless')"

   Store these answers and reuse them when the shape commands ask for similar information.

3. **Orchestrate Shape Commands** (Execute in sequence):

   For each shape command below, **load and follow the instructions** from the corresponding command file. Each shape command defines its own minimal question set and uses its template. **Reuse answers from the global quick-start questions** when applicable.

   **Phase 1: Project Brief**

   - Load shape command from `.claude/commands/mb/shape-project-brief.md` or `.cursor/commands/mb/shape-project-brief.md` (check both)
   - Follow its process (it will ask its own questions, but reuse project name, stack, architecture from Q1-Q4)
   - Generate `memory-bank/projectBrief.md` using template from `.cursor/templates/project-brief.template.md` (templates are shared)

   **Phase 2: Product Context**

   - Load shape command from `.claude/commands/mb/shape-product-context.md` or `.cursor/commands/mb/shape-product-context.md` (check both)
   - Follow its process (ask its questions one at a time)
   - Generate `memory-bank/productContext.md` using template from `.cursor/templates/product-context.template.md`

   **Phase 3: Tech Context**

   - Load shape command from `.claude/commands/mb/shape-tech-context.md` or `.cursor/commands/mb/shape-tech-context.md` (check both)
   - Follow its process (reuse stack info from Q3 when applicable)
   - Generate `memory-bank/techContext.md` using template from `.cursor/templates/tech-context.template.md`

   **Phase 4: System Patterns**

   - Load shape command from `.claude/commands/mb/shape-system-patterns.md` or `.cursor/commands/mb/shape-system-patterns.md` (check both)
   - Follow its process (reuse architecture info from Q4 when applicable)
   - Generate `memory-bank/systemPatterns.md` using template from `.cursor/templates/system-patterns.template.md`

4. **Initialize Active Context & Progress**:

   After the four main documents are generated:

   **Active Context**:

   - Read template from `.cursor/templates/active-context.template.md` (templates are shared)
   - Create `memory-bank/activeContext.md` with an initial entry:
     - Current timestamp (date and time)
     - Task: "Memory bank initialized"
     - Summary: "All core memory-bank documentation files have been created."
     - List the files that were generated
     - Next steps: "Review and refine documentation as needed"

   **Progress**:

   - Create `memory-bank/progress.md` with initial entry:
     - Current date
     - Entry: "Memory bank bootstrapped - created projectBrief.md, productContext.md, techContext.md, systemPatterns.md, activeContext.md, and progress.md"

5. **Validation Step**:

   After all files are generated, perform validation:

   - **Check file existence**: Verify all 6 files exist in `memory-bank/`:

     - `projectBrief.md`
     - `productContext.md`
     - `techContext.md`
     - `systemPatterns.md`
     - `activeContext.md`
     - `progress.md`

   - **Check completeness**: For each file, verify:

     - No empty sections (sections with only placeholders like `{{VARIABLE}}` or `TBD` without context)
     - Key sections are populated (e.g., Project Identity, Core Purpose, Tech Stack, etc.)
     - Files reference each other appropriately where relevant

   - **Check consistency**: Verify:

     - Project name matches across files
     - Tech stack mentioned consistently
     - Architecture type aligns across documents
     - User types mentioned in productContext align with goals in projectBrief

   - **Surface issues**:

     - List any `TBD`, `<!-- Verify -->`, or placeholder markers that need user attention
     - Note any sections that seem incomplete or need refinement
     - Identify any inconsistencies found

   - **Request confirmation**:

     - Respond: "Memory-bank initialization complete. Generated files: [list]. Issues found: [list any issues or 'None']. Please review and approve, or let me know what needs adjustment."
     - Wait for user approval before finalizing

   - **Finalize**:
     - If approved, ensure all files are written to `memory-bank/`
     - If user requests changes, make adjustments and re-validate
     - Once finalized, confirm: "Memory-bank is ready. Use `/update-active-context` to keep it current."

## Additional Best Practices

- **Minimize questions**: Each shape command already defines minimal question sets. Don't duplicate or expand them.
- **Reuse information**: Pass answers from global quick-start questions to shape commands to avoid asking the same thing twice.
- **Analyze codebase**: When generating documents, analyze the codebase (package.json, folder structure, existing code) to infer details and reduce questions.
- **Use templates**: Always use the corresponding template from `.cursor/templates/*.template.md` for structure (templates are shared between both environments).
- **Keep it concise**: Follow the same style as shape commands - clear purpose, step-by-step instructions, minimal but precise wording.
- **Update dynamically**: After initialization, use `/update-active-context` or other update commands to keep files current.

## Related Commands

- `/shape-project-brief`: Update projectBrief.md independently
- `/shape-product-context`: Update productContext.md independently
- `/shape-tech-context`: Update techContext.md independently
- `/shape-system-patterns`: Update systemPatterns.md independently
- `/update-active-context`: Update activeContext.md with current work focus
