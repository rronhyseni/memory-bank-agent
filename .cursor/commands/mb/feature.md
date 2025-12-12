---
description: Plan and execute a new feature with structured phases
output: memory-bank/features/active/**
---

# /mb/feature - Feature Planning & Execution

Plan and build features with structured, executable plans.

## Usage

- `/mb/feature` - Start new or resume current
- `/mb/feature <description>` - Start with inline description (skips question)
- `/mb/feature done` - Complete and archive

---

## CRITICAL RULES

1. **ONE PHASE AT A TIME** - Complete one phase, then STOP and wait
2. **NEVER ASSUME** - If you asked, wait for the answer
3. **NO FILES UNTIL APPROVED** - Only create after explicit "approve/yes/go"
4. **MAX 2 PLAN FILES** - One plan, or two if feature is large. Never more.
5. **PLANS = INTENT, NOT CODE** - Describe what to build, not the implementation
6. **READ SILENTLY** - Never narrate "I'm reading..." or "Let me check..."

---

## MODE DETECTION

Check `memory-bank/features/active/`:

| State              | Action                |
| ------------------ | --------------------- |
| Empty/missing      | **Mode A**: Start New |
| Has feature folder | **Mode B**: Resume    |
| User said "done"   | **Mode C**: Complete  |

---

## MODE A: Start New Feature

### PHASE 1: Discovery

**Silently read** (never mention this):

- All files in `memory-bank/`
- Relevant source files based on feature area

**If inline description provided** (e.g., `/mb/feature add dark mode toggle`):

- Skip directly to PHASE 2 questions
- Use the inline text as the feature description

**If no description**, respond ONLY:

> 🎯 **What feature are you building?**
>
> Describe what it should do.

**⛔ STOP. Wait for response.**

---

### PHASE 2: Clarifying Questions

After user describes the feature, ask **exactly 4 questions**.

**CRITICAL**:

- Questions must be **specific to this feature**, not generic
- Skip questions already answered by memory-bank files
- Each question should bundle multiple related details

**Format:**

> Got it! **[one-sentence summary of feature]**
>
> Quick questions:
>
> 1. **Success criteria**: What's the ONE thing that must work? Who uses it, what outcome?
>
> 2. **Scope & outputs**: What's in/out of scope? Which files created/modified, which untouched?
>
> 3. **Patterns & constraints**: Which existing patterns to follow? (Reference a specific file.) Any must-avoid?
>
> 4. **Approach & verification**:
>    - 🧪 TDD (tests first) / 🚀 Direct (code first) / ⚡ Hybrid (tests for critical paths)
>    - How do we verify it works? (command + expected output)

**⛔ STOP. Wait for ALL answers.**

---

### PHASE 3: Plan Proposal

**If answers are unclear**: Ask follow-up, then STOP. Do NOT proceed with ambiguity.

**When clear**, propose the plan. **DO NOT create files yet.**

Determine plan count:

- **1 plan** (default): Feature can be built in a logical sequence
- **2 plans** (only if needed): Feature has distinct layers that benefit from separation (e.g., backend + frontend)

**Format:**

> 📋 **Feature: [Name]**
>
> **Goal:** [From success criteria] > **Approach:** [TDD/Direct/Hybrid] > **Plans:** [1 or 2]
>
> ---
>
> ### Plan Overview
>
> | Step | What     | Files          | Verification    |
> | ---- | -------- | -------------- | --------------- |
> | 1    | [Action] | `path/to/file` | [How to verify] |
> | 2    | [Action] | `path/to/file` | [How to verify] |
> | 3    | [Action] | `path/to/file` | [How to verify] |
> | ...  | ...      | ...            | ...             |
>
> **Patterns to follow:** [Reference existing files] > **Anti-patterns:** [What NOT to do]
>
> ---
>
> **Look good?**
>
> - ✅ "approve" - Create plan and start
> - ✏️ "change X" - Adjust
> - 🔄 "start over" - Fresh start

**⛔ STOP. Wait for approval.**

---

### PHASE 4: Create Plan & Begin

**Only after explicit approval.**

#### Step 1: Create Structure

memory-bank/features/active/[feature-slug]/
├── \_index.md # Overview + acceptance criteria
└── plan.md # Detailed execution plan (optional: plan-2.md if 2 plans are truly needed)

#### Step 2: Write `_index.md`

Use `.cursor/templates/_index.template.md`. Include:

- Feature summary
- Acceptance criteria (checkboxes)
- Scope (in/out)
- Link to plan file(s)

#### Step 3: Write `plan.md`

Use `.cursor/templates/plan.template.md`.

**Plan writing rules:**

- Be specific about **where** - exact file paths
- Reference existing patterns - point to real files in the codebase
- State **what**, not **how** - describe outcomes, not implementation/code
- Every step must have a **verification command + expected result**
- Include anti-patterns to prevent drift

#### Step 4: Update Memory Bank (minimum)

- `memory-bank/progress.md`: Add feature to Roadmap as 🔨 Active
- `memory-bank/active-context.md`: Set current feature + status

#### Step 5: Confirm

✅ Plan created!

📁 `memory-bank/features/active/[slug]/`

- `_index.md` - Overview
- `plan.md` - [X] steps (and optional `plan-2.md`)

Ready to start?

- "yes" - Execute Step 1
- "show plan" - Review plan details
- "later" - Save for next session

⛔ STOP. Wait for response. **NEVER LOG THIS TO THE USER**

---

### PHASE 5: Execute Steps

When user says "yes" or "continue":

1. Read `plan.md` to find the next incomplete step
2. Execute the step (write actual code now)
3. Run verification and report result
4. Update `plan.md` - check off `- [x] Done`

Report:

✅ Step [N] Complete

- Done: [What was built]
- Files: [Created/modified]
- Verified: [Result]

Next: Step [N+1] - [Title]

Continue? (yes / pause / show plan)

⛔ STOP. Wait for response. **NEVER LOG THIS TO THE USER**

MODE B: Resume Feature
Silently read memory-bank/ files and active feature's \_index.md + plan.md.

📍 Resuming: [Feature Name]

Status Info
Progress Step [N] of [Total]
Last done [Last completed step]
Next up Step [N]: [Title]
Options:

"continue" - Execute next step
"show plan" - See full plan
"done" - Complete feature
"abandon" - Archive incomplete
⛔ STOP. Wait for response.

MODE C: Complete Feature
Verify Completion
Check \_index.md acceptance criteria.

If incomplete:

⚠️ Not done yet:

[Missing criterion]
Complete anyway? (yes / no)

Archive
Add completion timestamp to \_index.md
Move folder: features/active/[name]/ → features/archive/[YYYY-MM-DD]-[name]/
Update progress.md: Mark ✅ Done
Clear active-context.md current feature
🎉 Feature Complete: [Name]

Steps: [N] | Archived: features/archive/[date]-[name]/

What's next?

/mb/feature - Start another
/mb/update-active-context - Update context
INTERRUPTION HANDLING
If user says "pause", "stop", "later":

Save current step status in plan.md
Update active-context.md with paused state
Respond:
⏸️ Saved! Stopped at Step [N]. Run /mb/feature to resume.

ERROR HANDLING
If a step fails:

❌ Step [N] failed

Error: [What happened]
Options: "fix" / "skip" / "help"

Log blocker in plan.md.

---
