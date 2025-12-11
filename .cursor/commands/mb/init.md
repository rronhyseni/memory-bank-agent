---
description: Initialize the memory-bank system by creating all core documentation files
output: memory-bank/*.md
---

# Memory Bank Rules for Cursor AI

## Overview

This file defines a persistent memory system using Markdown files in `memory-bank/` to provide AI with structured, updatable context. Files follow a hierarchy: foundational (`project-brief.md`) informs others. Use slash commands for automation. Best practices: Keep files concise, update dynamically, validate often to reduce hallucinations.

## Core Files

- `project-brief.md`: High-level scope, goals, requirements.
- `product-context.md`: Users, problems, UX journeys.
- `system-patterns.md`: Architecture, patterns, decisions.
- `tech-context.md`: Stack, dependencies, constraints.
- `active-context.md`: Current tasks, notes.
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

   - Respond: "Initializing memory-bank. Analyzing codebase to infer project details, then generating all core documentation files. I'll only ask questions when I can't confidently infer information (below 80% confidence)."
   - Create `memory-bank/` directory if it doesn't exist.

2. **Aggressive Codebase Analysis** (Do this FIRST, before any questions):

   **CRITICAL**: Analyze the codebase thoroughly to infer as much information as possible. Only ask questions when confidence is below 80%.

   Analyze these sources in order:

   - **Project metadata**: `package.json`, `package-lock.json`, `yarn.lock`, `pnpm-lock.yaml` - extract name, dependencies, scripts, engines
   - **Repository structure**: Top-level folders, `src/`, `app/`, `lib/`, `components/`, `api/`, `db/`, etc. - infer architecture type
   - **Configuration files**: `tsconfig.json`, `next.config.js`, `vite.config.js`, `tailwind.config.js`, `.eslintrc`, `docker-compose.yml`, etc. - infer tech stack details
   - **Existing documentation**: `README.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, any existing docs - extract project purpose, features, setup
   - **Source code patterns**: Route structures, component organization, API endpoints, database schemas - infer features and user flows
   - **Environment files**: `.env.example`, `.env.local.example` - infer external services and infrastructure
   - **Git history**: Recent commits, branch names - infer current status and recent work

   **Inference Rules**:

   - If you can infer with 80%+ confidence from codebase analysis → **USE IT, DON'T ASK**
   - If inference is uncertain (<80% confidence) → **ASK ONLY THAT SPECIFIC QUESTION**
   - For ambiguous cases, make reasonable assumptions and mark with `<!-- Verify -->` for user review later

3. **Minimal Questions** (Only when absolutely necessary):

   Only ask questions for information that cannot be reliably inferred from codebase analysis:

   - **Project purpose**: Only if README/docs don't explain it clearly
   - **User types**: Only if codebase doesn't reveal user roles (check auth, routes, permissions)
   - **Business model**: Only if it's not evident from features/code
   - **Architecture type**: Only if folder structure is ambiguous (monorepo vs monolith vs microservices)

   **Important**: If you're 80%+ confident about something, implement it directly. Users can refine later using `/shape-*` commands.

4. **Generate All Documents** (Execute in sequence, using inferred + answered information):

   For each document, **load the corresponding template** and **generate directly** using all inferred information. Don't delegate to shape commands - generate files yourself.

   **Phase 1: Project Brief**

   - Read `.cursor/templates/project-brief.template.md`
   - Use all inferred information from codebase analysis
   - Generate `memory-bank/project-brief.md` directly
   - Mark uncertain sections with `<!-- Verify -->` for user review

   **Phase 2: Product Context**

   - Read `.cursor/templates/product-context.template.md`
   - Infer user journeys from routes, pages, and component structure
   - Infer features from API endpoints, database models, and component organization
   - Generate `memory-bank/product-context.md` directly
   - Mark uncertain sections with `<!-- Verify -->` for user review

   **Phase 3: Tech Context**

   - Read `.cursor/templates/tech-context.template.md`
   - Extract tech stack from `package.json` and config files
   - Infer dependencies, infrastructure, and dev environment from codebase
   - Generate `memory-bank/tech-context.md` directly
   - Mark uncertain sections with `<!-- Verify -->` for user review

   **Phase 4: System Patterns**

   - Read `.cursor/templates/system-patterns.template.md`
   - Infer architecture patterns from folder structure and code organization
   - Analyze design patterns from existing code
   - Generate `memory-bank/system-patterns.md` directly
   - Mark uncertain sections with `<!-- Verify -->` for user review

5. **Initialize Active Context & Progress**:

   After the four main documents are generated:

   **Active Context**:

   - Read `.cursor/templates/active-context.template.md`
   - Create `memory-bank/active-context.md` with an initial entry:
     - Current timestamp (date and time)
     - Task: "Memory bank initialized"
     - Summary: "All core memory-bank documentation files have been created."
     - List the files that were generated
     - Next steps: "Review and refine documentation as needed. Use `/shape-*` commands to refine any sections marked with `<!-- Verify -->`."

   **Progress**:

   - Create `memory-bank/progress.md` with initial entry:
     - Current date
     - Entry: "Memory bank bootstrapped - created project-brief.md, product-context.md, tech-context.md, system-patterns.md, active-context.md, and progress.md"

6. **Validation Step**:

   After all files are generated, perform validation:

   - **Check file existence**: Verify all 6 files exist in `memory-bank/`:

     - `project-brief.md`
     - `product-context.md`
     - `tech-context.md`
     - `system-patterns.md`
     - `active-context.md`
     - `progress.md`

   - **Check completeness**: For each file, verify:

     - No empty sections (sections with only placeholders like `{{VARIABLE}}` or `TBD` without context)
     - Key sections are populated (e.g., Project Identity, Core Purpose, Tech Stack, etc.)
     - Files reference each other appropriately where relevant

   - **Check consistency**: Verify:

     - Project name matches across files
     - Tech stack mentioned consistently
     - Architecture type aligns across documents
     - User types mentioned in product-context align with goals in project-brief

   - **Surface issues**:

     - List any `TBD`, `<!-- Verify -->`, or placeholder markers that need user attention
     - Note any sections that seem incomplete or need refinement
     - Identify any inconsistencies found

   - **Finalize**:

     - Respond: "Memory-bank initialization complete. Generated files: [list]. Issues found: [list any issues or 'None']. Review the files and use `/shape-*` commands to refine any sections marked with `<!-- Verify -->`."
     - No need to wait for approval - files are already generated and can be refined using shape commands

## Additional Best Practices

- **Prioritize inference over questions**: Always analyze codebase first, only ask when <80% confident
- **Make reasonable assumptions**: It's better to generate with reasonable assumptions (marked `<!-- Verify -->`) than to ask many questions
- **Use shape commands for refinement**: Users can refine any file using `/shape-*` commands after initialization
- **Analyze codebase aggressively**: When generating documents, analyze the codebase (package.json, folder structure, existing code) to infer details and reduce questions.
- **Use templates**: Always use the corresponding template from `.cursor/templates/*.template.md` for structure.
- **Keep it concise**: Follow the same style as shape commands - clear purpose, step-by-step instructions, minimal but precise wording.
- **Update dynamically**: After initialization, use `/update-active-context` or other update commands to keep files current.

## Related Commands

- `/shape-project-brief`: Update project-brief.md independently
- `/shape-product-context`: Update product-context.md independently
- `/shape-tech-context`: Update tech-context.md independently
- `/shape-system-patterns`: Update system-patterns.md independently
- `/update-active-context`: Update active-context.md with current work focus
