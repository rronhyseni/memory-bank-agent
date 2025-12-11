# /mb/feature - Guided Feature Development

Start a new feature, resume current work, or complete a feature.

## Usage

- `/mb/feature` - Start new or resume current
- `/mb/feature done` - Complete and archive current feature

---

## CRITICAL RULES FOR AI

**YOU MUST FOLLOW THESE RULES:**

1. **ONE PHASE PER RESPONSE** - Complete only ONE phase, then END your response
2. **NEVER ASSUME ANSWERS** - If you asked a question, WAIT for the user to answer
3. **NEVER CREATE FILES** until user explicitly approves the spec
4. **END RESPONSE** after each phase - let user respond before continuing
5. **NO "proceeding with reasonable assumptions"** - This is FORBIDDEN

---

## MODE DETECTION

First, check `memory-bank/features/active/` directory:

- **Empty?** → Start New Feature (Mode A)
- **Has .md file?** → Resume Feature (Mode B)
- **User said "done"?** → Complete Feature (Mode C)

---

## MODE A: Start New Feature

### PHASE 1: Discovery (ONE question only)

**Read silently** (don't list these):

- `memory-bank/project-brief.md`
- `memory-bank/system-patterns.md`
- `memory-bank/tech-context.md`

**Then ask ONE question:**

> 🎯 **What feature are you building?**
>
> Describe it in your own words - what should it do?

**⛔ END YOUR RESPONSE HERE. Wait for user to describe the feature.**

---

### PHASE 2: Clarifying Questions

After user describes the feature, ask 3-4 targeted questions based on what they said.

**Format your response like this:**

> Thanks! I understand you want to build **[restate feature in one sentence]**.
>
> A few questions to make sure I get this right:
>
> 1. **Goal**: What does success look like when this is done? (one sentence)
>
> 2. **Scope**: [Ask about scope based on their description - e.g., "Does this need a new API endpoint, or just frontend changes?"]
>
> 3. **Approach**: How do you want to build this?
>
>    - **TDD** - Write tests first, then implement
>    - **Direct** - Implement directly, add tests after
>    - **Hybrid** - Tests for critical paths only
>
> 4. **Constraints**: Any deadlines, required libraries, or things to avoid? _(optional - say "none" to skip)_

**⛔ END YOUR RESPONSE HERE. Wait for user to answer ALL questions.**

---

### PHASE 3: Draft Spec (AI generates, user reviews)

After user answers questions, generate a draft spec. DO NOT create any files yet.

**Format your response like this:**

> 📋 **Draft Spec: [Feature Name]**
>
> Based on your answers, here's what I'm proposing:
>
> ---
>
> **Goal:** [Their goal statement]
>
> **Scope:** [What's included/excluded]
>
> **Approach:** [TDD/Direct/Hybrid]
>
> ---
>
> ### Acceptance Criteria (AI-suggested)
>
> - [ ] [Criterion 1 - based on their description]
> - [ ] [Criterion 2]
> - [ ] [Criterion 3]
> - [ ] [Add more as appropriate]
>
> ### Edge Cases to Handle
>
> - [ ] [Edge case 1 - think about what could go wrong]
> - [ ] [Edge case 2]
> - [ ] [Edge case 3]
>
> ### Implementation Steps
>
> | #   | Step               | Type                 | Confidence |
> | --- | ------------------ | -------------------- | ---------- |
> | 1   | [Step description] | Setup/Implement/Test | 🟢/🟡/🔴   |
> | 2   | [Step description] | ...                  | ...        |
> | 3   | [Step description] | ...                  | ...        |
>
> > **Confidence:** 🟢 Clear path | 🟡 Needs verification | 🔴 Needs clarification
>
> ---
>
> **Does this look right?**
>
> - ✅ **"yes"** or **"approve"** - I'll create the blueprint
> - ✏️ **"edit: [your changes]"** - Tell me what to adjust
> - ❌ **"start over"** - We'll begin fresh

**⛔ END YOUR RESPONSE HERE. Wait for user to approve, edit, or reject.**

---

### PHASE 4: Refinement (if user requests edits)

If user says "edit: [changes]", update the spec and show it again.

Repeat PHASE 3 with the changes incorporated.

**⛔ END YOUR RESPONSE HERE. Wait for approval.**

---

### PHASE 5: Create Blueprint (only after explicit approval)

**Only proceed here if user said "yes", "approve", "looks good", "go", "ACT", or similar approval.**

1. **Create directory** (if needed): `memory-bank/features/active/`

2. **Create blueprint file**: `memory-bank/features/active/[feature-name-kebab-case].md`

   Use the template from `.cursor/templates/blueprint.template.md` and fill with approved spec.

3. **Update `progress.md`** Roadmap table:

   ```
   | # | Feature | Status | Approach |
   | 1 | [Feature Name] | 🔨 Active | [TDD/Direct/Hybrid] |
   ```

4. **Update `active-context.md`**:

   - Add: "## Current Feature\nWorking on: [Feature Name] - Step 1"

5. **Confirm creation:**

> ✅ **Blueprint created!**
>
> 📄 `memory-bank/features/active/[name].md`
>
> **Next:** Ready to start Step 1?
>
> - **"yes"** - Begin implementation
> - **"later"** - Save for next session (run `/mb/feature` to resume)

**⛔ END YOUR RESPONSE HERE. Wait for user to say yes or later.**

---

### PHASE 6: Begin Implementation

If user says "yes" to starting:

1. Read the blueprint
2. Execute Step 1
3. After completing step, update blueprint:
   - Check the checkbox
   - Add log entry
   - Update metrics
4. Ask before continuing to Step 2

---

## MODE B: Resume Feature

### PHASE 1: Load and Show Status

Read the `.md` file in `memory-bank/features/active/`

**Show status:**

> 📍 **Resuming: [Feature Name]**
>
> | Status         | Value                    |
> | -------------- | ------------------------ |
> | Progress       | Step [X] of [Y]          |
> | Approach       | [TDD/Direct/Hybrid]      |
> | Last completed | [Step name]              |
> | Next step      | [Step name] [Confidence] |
>
> **Continue with [Next Step Name]?**
>
> - **"yes"** - Continue implementation
> - **"show plan"** - See full blueprint
> - **"abandon"** - Archive incomplete

**⛔ END YOUR RESPONSE HERE. Wait for user response.**

---

### PHASE 2: Continue or Show Plan

Based on user's choice:

- **"yes"**: Execute next unchecked step, update blueprint
- **"show plan"**: Display entire blueprint, then ask to continue
- **"abandon"**: Confirm, then archive with `[ABANDONED]` prefix

---

## MODE C: Complete Feature (`/mb/feature done`)

### PHASE 1: Verify Completion

Check the blueprint for:

- All plan checkboxes checked?
- All acceptance criteria checked?
- All edge cases handled?
- Blockers resolved?

**If incomplete, show what's missing:**

> ⚠️ **Feature not fully complete:**
>
> **Missing steps:**
>
> - [ ] Step 4: Integration tests
>
> **Missing acceptance criteria:**
>
> - [ ] Error states handled
>
> **Complete anyway?** (yes / no, continue working)

**⛔ END YOUR RESPONSE HERE. Wait for user response.**

---

### PHASE 2: Archive and Celebrate

If complete (or user confirms):

1. Calculate metrics from log entries
2. Add completion timestamp
3. Move file: `features/active/[name].md` → `features/archive/YYYY-MM-DD-[name].md`
4. Update `progress.md`: Change status to ✅ Done
5. Update `active-context.md`: Remove current feature section

**Show celebration:**

> ✅ **Feature Complete: [Name]**
>
> | Metric          | Value  |
> | --------------- | ------ |
> | Total time      | ~Xh Xm |
> | Steps completed | X/X    |
> | Tests written   | X      |
>
> **Archived:** `features/archive/YYYY-MM-DD-[name].md`
>
> 🚀 Run `/mb/feature` to start another!

---

## REMINDERS FOR AI

### NEVER DO THESE:

- ❌ Ask questions and answer them yourself
- ❌ Say "proceeding with reasonable assumptions"
- ❌ Create files before user approves spec
- ❌ Continue to next phase without user input
- ❌ Bundle multiple phases in one response

### ALWAYS DO THESE:

- ✅ End response after each phase
- ✅ Wait for user to respond before continuing
- ✅ Confirm understanding before generating spec
- ✅ Get explicit approval before creating files
- ✅ Show what you're about to do before doing it

---

## TDD Enforcement (when enabled)

| Test Type   | When to Use                  | Speed  |
| ----------- | ---------------------------- | ------ |
| Unit        | Single function/component    | Fast   |
| Integration | Multiple components + DB/API | Medium |
| E2E         | Full user flows              | Slow   |

For each implementation step in TDD mode:

1. Write test file first
2. Run tests - must FAIL (red)
3. Implement minimum code to pass
4. Run tests - must PASS (green)
5. Refactor if needed

---

## Context Consistency

Before ANY code generation:

1. Check `system-patterns.md` - use established patterns
2. Check `tech-context.md` - use correct deps/versions
3. Match existing code style

---

## Interruption Handling

If user needs to stop mid-step:

1. Save progress to blueprint Log section
2. Note where work stopped
3. Respond: "Progress saved. Run `/mb/feature` to resume."
