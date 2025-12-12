---
description: Update the active-context.md file for the memory bank with current session context
output: memory-bank/active-context.md
---

# Update Active Context

You are a project memory and context specialist. Your task is to keep `memory-bank/active-context.md` up to date with the **current work focus, relevant background, and next steps**, so future sessions can quickly understand "what's going on" and "why".

## Purpose

- **Maintain session continuity**: capture what is being worked on right now, why, and what changed.
- **Reduce AI "amnesia"**: provide a single, always-current place that explains recent work and decisions.
- **Guide next steps**: record concrete next actions, open questions, and blockers.

The end result should be an **updated `active-context.md`** (created if missing) with a **clearly timestamped entry** describing the current focus.

---

## When to Use

Use this command:

- **At the end of a working session** to summarize what was done and what is next.
- **When starting a new task or feature** to capture the new focus.
- **When context has drifted** (new branch, different area of the codebase, new blockers).

---

## Questions to Ask

Ask these **one at a time**, in a conversational way. Keep questions minimal; do the heavy lifting yourself.

### Q1: Current Focus

"What are you currently working on? (feature/bug/task name + 1–2 sentence description)"

### Q2: Scope & Touchpoints

"Which branch and key files (or areas of the app) are involved in this work?"

### Q3: Status & Progress

"What is the current status of this work? (e.g., exploring, in progress, nearly done, blocked, complete)"

### Q4: Blockers & Open Questions

"Any blockers, open questions, or tricky parts we should capture for next time?"

### Q5: Next Steps

"What are the next 2–5 concrete steps you expect to take from here?"

If the user indicates that some information is unchanged from a previous session (e.g., same branch or same blockers), **reuse prior details** instead of re-asking.

---

## Generation Instructions

After gathering answers:

1. **Determine current timestamp** in the user's local time (include date and time, e.g., `2025-12-10 15:42`).
2. **Inspect the codebase and environment when possible** to enrich context:
   - If a git repository is available, infer:
     - Current branch name
     - Modified/uncommitted files and their paths
   - Otherwise, infer relevant files/folders from recent edits and paths mentioned by the user.
3. **Read the template** from `.cursor/templates/active-context.template.md`.
4. **Read existing `memory-bank/active-context.md` if it exists** to understand prior entries and avoid duplicating content.
5. **Generate a new entry** using the template structure, filling in:
   - Current task/feature name and status
   - Short summary of what has been done and why it matters
   - Relevant background: branch, modified files, related memory-bank docs, project structure
   - Next steps / to-dos / open questions / blockers as a short checklist.
6. **Update `active-context.md`**:
   - If the file **does not exist**, create it using the template with a single, current entry.
   - If the file **already exists**, **prepend or append a new timestamped entry** (most recent context should be easiest to find at the top), preserving previous history.
7. **Keep the writing concise and scannable**:
   - Prefer short paragraphs and bullet lists.
   - Avoid repeating full historical detail from older sessions unless it is still relevant.

---

## Important Guidelines

- **Be concise but informative**: optimize for quick understanding by a future reader (human or AI).
- **Prioritize the "why" and "what's next"** over low-level implementation details.
- **Reference other memory-bank docs** (project brief, product context, system patterns, tech context) when relevant rather than duplicating their content.
- **Use clear headings and checklists** so the latest context, blockers, and next steps are obvious at a glance.

---

## Template Location

Use template: `.cursor/templates/active-context.template.md`

## Output Location

Save to: `memory-bank/active-context.md`
