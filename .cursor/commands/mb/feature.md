cat > "/Users/rronhyseni/Desktop/POVIO/memory-bank-agent/.cursor/commands/mb/feature.md" << 'ENDOFFILE'

# /mb/feature - Unified Feature Development

Start a new feature, resume current work, or complete a feature.

## Usage

- `/mb/feature` - Start new or resume current
- `/mb/feature done` - Complete and archive current feature

---

## Workflow

### MODE DETECTION

First, check `memory-bank/features/active/` directory:

- **Empty?** → Start New Feature (Mode A)
- **Has .md file?** → Resume Feature (Mode B)
- **User said "done"?** → Complete Feature (Mode C)

---

### MODE A: Start New Feature

#### Step 1: Context Load (Silent)

Read these files to understand the project:

- `memory-bank/project-brief.md`
- `memory-bank/system-patterns.md`
- `memory-bank/tech-context.md`
- `memory-bank/active-context.md`

#### Step 2: Gather Information

Ask the user:

> 🎯 What feature are you building?

After they respond, ask these follow-ups (adapt based on their answer):

> Got it! A few quick questions:
>
> **Goal**: What does success look like? (one sentence)
>
> **Scope**: Does this touch existing code, or is it mostly new?
> _(I see from system-patterns you're using {{ARCHITECTURE_TYPE}})_
>
> **Approach**: How do you want to build this?
>
> - □ TDD - Write tests first, then implement
> - □ Direct - Implement directly, add tests after
> - □ Hybrid - Tests for critical paths only
>
> **Constraints**: Any deadlines, required libraries, or things to avoid?
> _(optional - press enter to skip)_

#### Step 2.5: AI Acceptance Criteria (Optional)

After gathering feature info, offer:

> Would you like me to generate acceptance criteria based on:
>
> - Your description
> - Similar patterns in `system-patterns.md`
> - Common edge cases for this type of feature
>
> □ Yes, generate suggestions
> □ No, I'll write my own

If yes, generate 3-5 acceptance criteria and show for approval/editing.

#### Step 3: Scope Check

If the feature description touches more than 3 major areas from `system-patterns.md`:

> This looks like a large feature touching multiple systems:
>
> - [Area 1]
> - [Area 2]
> - [Area 3]
>
> Would you like to:
>
> - □ Break into smaller features (recommended)
> - □ Proceed as one feature (complex)

#### Step 3.5: Visual Planning (Complex Features)

If feature touches 3+ components, generate:

> 📊 Here's a visual flow of this feature:
>
> ```mermaid
> flowchart LR
>     A[User Action] --> B[Component]
>     B --> C[API Call]
>     C --> D[Result]
> ```
>
> Does this match your mental model? (yes / adjust)

#### Step 4: Generate Blueprint

Create file: `memory-bank/features/active/[feature-name-kebab-case].md`

Use the blueprint template from `.cursor/templates/blueprint.template.md`

Fill in:

- Feature name and goal
- **Context Snapshot** (architecture, patterns, related files, dependencies)
- EARS requirements based on discussion
- Edge cases (ask if not mentioned)
- Implementation steps (3-8 depending on complexity)
- **Confidence scores** for each step (🟢/🟡/🔴)
- Acceptance criteria (AI-generated or user-provided)
- **Decisions table** (if any decisions made during planning)
- TDD test type table if enabled
- Mermaid diagram if complex

**Step sizing guidelines:**

| Type      | Duration  | Example                      |
| --------- | --------- | ---------------------------- |
| Setup     | 5-15 min  | Install deps, create files   |
| Test      | 10-20 min | Write tests for one flow     |
| Implement | 15-30 min | Build one component/function |
| Integrate | 15-30 min | Wire things together         |
| Verify    | 5-10 min  | Run tests, manual check      |
| Review    | 10-20 min | Self-review, refactor        |

**Confidence scoring:**

| Score     | Meaning                  | Action                   |
| --------- | ------------------------ | ------------------------ |
| 🟢 High   | Clear path, no unknowns  | Proceed                  |
| 🟡 Medium | Some verification needed | Note what to check       |
| 🔴 Low    | Needs clarification      | Ask before starting step |

#### Step 5: Approval

Show the generated blueprint and ask:

> 📋 Blueprint ready! Review above.
>
> Proceed? (yes / edit / cancel)

#### Step 6: Update Roadmap

On approval, update `progress.md` Roadmap table:

| #   | Feature          | Status    | Approach              |
| --- | ---------------- | --------- | --------------------- |
| 1   | {{FEATURE_NAME}} | 🔨 Active | {{TDD/Direct/Hybrid}} |

#### Step 7: Begin Work

On approval:

1. Update `memory-bank/active-context.md`:
   - Add: "## Current Feature\nWorking on: [Feature Name] - Step 1"
2. Start executing Step 1
3. After completing, update blueprint:
   - Check box
   - Add log entry with time spent
   - Update Metrics section
4. Continue to next step

---

### MODE B: Resume Feature

#### Step 1: Load Blueprint

Read the `.md` file in `memory-bank/features/active/`

#### Step 1.5: Smart Resume

Before showing status, analyze:

1. **Time gap**: If > 24 hours since last work, load extra context
2. **Git changes**: Check for any manual changes to related files
3. **Blockers**: Review Blockers & Questions section
4. **Low confidence steps**: Flag any 🔴 steps coming up

If significant time passed (> 24h):

> 📍 It's been {{DAYS}} days since you worked on this.
>
> **Quick context refresh:**
>
> - Architecture: {{ARCHITECTURE_TYPE}}
> - Last completed: Step {{N}} - {{STEP_NAME}}
> - Key decision: {{LAST_DECISION}}
> - Open questions: {{BLOCKERS_COUNT}}
>
> Ready to continue?

#### Step 2: Show Status

> 📍 **Resuming: [Feature Name]**
>
> **Progress**: Step [X] of [Y] > **TDD**: [Enabled/Disabled] > **Last**: [What was done in previous step] > **Next**: [Current unchecked step] {{CONFIDENCE}} > **Blockers**: [Count of open blockers]
>
> Continue? (yes / show full plan / abandon)

If next step has 🔴 Low confidence:

> ⚠️ Next step has low confidence. Let's clarify before proceeding:
> [Show the uncertainty and ask for clarification]

#### Step 3: Continue Work

On "yes":

1. Execute the current unchecked step
2. Update blueprint:
   - Checkbox
   - Log entry with time spent
   - Metrics section
3. Continue to next step
4. Work until user stops or feature complete

On "show full plan":

- Display entire blueprint
- Ask to continue

On "abandon":

- Confirm: "Archive incomplete? This will move to archive with status 'Abandoned'"
- If yes: Move to archive with `[ABANDONED]` prefix in filename

---

### MODE C: Complete Feature (`/mb/feature done`)

#### Step 1: Verify Completion

Check the blueprint:

- All plan checkboxes checked?
- All acceptance criteria checked?
- All edge cases handled?
- Blockers section resolved?

If incomplete:

> ⚠️ Feature not fully complete:
>
> **Missing steps:**
>
> - Step 4: Integration tests
>
> **Missing acceptance criteria:**
>
> - Error states handled
>
> **Unresolved blockers:**
>
> - ❓ Rate limiting approach
>
> Complete anyway? (yes / no, continue working)

#### Step 2: Calculate Metrics

Gather from log entries:

- Total time (sum of step times)
- Steps completed
- Tests written (count from TDD logs)
- Files modified (from git or log)
- Blockers encountered

Update Metrics section in blueprint.

#### Step 3: Archive

1. Add completion timestamp and summary to blueprint
2. Update Completion section:

   ```markdown
   **Completed:** YYYY-MM-DD
   **Duration:** ~Xh Xm
   **Final Status:** ✅ Complete

   > Summary: Brief description of what was built
   ```

3. Move file: `features/active/[name].md` → `features/archive/YYYY-MM-DD-[name].md`

#### Step 4: Update Memory Bank

**Update `progress.md`:**

- Update Roadmap table: Change status to ✅ Done
- Add to "Completed" section with date and summary:

  ```markdown
  ### December 2024

  - **[Feature Name]** (YYYY-MM-DD) - Brief summary
    [→ archive](./features/archive/YYYY-MM-DD-feature-name.md)
  ```

**Update `active-context.md`:**

- Remove current feature section
- Add note: "Completed [Feature Name] on [date]"

#### Step 5: Celebrate

> ✅ **Feature Complete: [Name]**
>
> **Summary:**
>
> - [x] steps completed
> - [Y] tests passing (if TDD)
> - ~[Z]h total time
> - Started: [date] → Completed: [date]
>
> **Archived:** `features/archive/YYYY-MM-DD-[name].md`
>
> 🚀 What's next? Run `/mb/feature` to start another.

---

## TDD Enforcement

When TDD is enabled, for each implementation unit:

### Test Classification

| Test Type   | When to Use                  | Speed  |
| ----------- | ---------------------------- | ------ |
| Unit        | Single function/component    | Fast   |
| Integration | Multiple components + DB/API | Medium |
| E2E         | Full user flows              | Slow   |

### Test Step

1. Identify test type for this unit
2. Write test file for this functionality
3. Run tests - they MUST fail (red)
4. Log: "Tests written: [file], Type: [Unit/Integration/E2E], Status: 🔴 Red"

### Implement Step

1. Write minimum code to pass tests
2. Run tests - they MUST pass (green)
3. Log: "Implementation complete, Status: 🟢 Green"
4. Refactor if needed (keep green)

### Verify

Always show test output after implementation.

For E2E tests, check if user has Playwright configured and use browser testing.

---

## Context Consistency

Before ANY code generation:

1. Check `system-patterns.md` - use established patterns
2. Check `tech-context.md` - use correct deps/versions
3. Match existing code style

If deviating from patterns:

1. Add to Decisions table with rationale
2. Note in blueprint Log with reason

---

## Interruption Handling

If user needs to stop mid-step:

1. Save progress to blueprint Log section
2. Note exactly where work stopped
3. Add any open questions to Blockers section
4. Update Metrics with partial time
5. Respond: "Progress saved. Run `/mb/feature` to resume anytime."

---

## Error Recovery

If something goes wrong during implementation:

1. Add to Blockers section: `🚧 Blocked: [description]`
2. Log the error in current step
3. Suggest next actions:
   - Research the issue
   - Try alternative approach
   - Ask for help

---

## Best Practices

1. **Keep steps small** - 30 min max per step
2. **Log everything** - Future you will thank present you
3. **Resolve blockers early** - Don't carry them across sessions
4. **Update confidence** - As you learn, upgrade 🔴 → 🟡 → 🟢
5. **Celebrate progress** - Each checked box is a win ✅
   ENDOFFILE
