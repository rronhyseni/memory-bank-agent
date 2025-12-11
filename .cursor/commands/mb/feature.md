# /mb/feature - Deep Feature Planning & Execution

Start a new feature with deep phase plans, resume current work, or complete a feature.

## Usage

- `/mb/feature` - Start new or resume current
- `/mb/feature done` - Complete and archive current feature

---

## CRITICAL RULES FOR AI

**YOU MUST FOLLOW THESE RULES ABSOLUTELY:**

1. **ONE PHASE PER RESPONSE** - Complete only ONE phase, then STOP
2. **NEVER ASSUME ANSWERS** - If you asked a question, WAIT for the user to answer
3. **NEVER CREATE FILES** until user explicitly says "approve", "yes", "go", or "looks good"
4. **STOP AFTER EACH PHASE** - Let user respond before continuing
5. **NO "proceeding with assumptions"** - This is FORBIDDEN
6. **MAX 3-4 PHASES PER FEATURE** - If more needed, feature is too big. Ask to split.
7. **DEEP PLANS, NOT TASK LISTS** - Each phase plan must be prescriptive with code skeletons

---

## MODE DETECTION

First, check `memory-bank/features/active/` directory:

- **Empty or does not exist?** → Start New Feature (Mode A)
- **Has a feature folder?** → Resume Feature (Mode B)
- **User said "done"?** → Complete Feature (Mode C)

---

## MODE A: Start New Feature

### PHASE 1: Discovery

**Read silently** (DO NOT list or mention reading these):

- `memory-bank/project-brief.md`
- `memory-bank/system-patterns.md`
- `memory-bank/tech-context.md`

**Then ask ONE question:**

🎯 **What feature are you building?**

Describe what it should do in your own words.

**⛔ STOP. Wait for user response.**

---

### PHASE 2: Clarifying Questions

After user describes the feature, ask 3-4 targeted questions.

**Format:**

> Got it! You want to build **[one-sentence summary of their feature]**.

Quick questions to nail the spec:

1. **Success:** What is the ONE thing that must work for this to be "done"?

2. **Scope:** [Context-specific question based on their description and your reading of system-patterns.md]

3. **Approach:** How do you want to build this?
   - 🧪 **TDD** - Tests first, then code (recommended for logic-heavy features)
   - 🚀 **Direct** - Code first, tests after (faster for UI/prototypes)
   - ⚡ **Hybrid** - Tests for critical paths only

4. **Constraints:** Anything to avoid or must-use? (say "none" to skip)

**⛔ STOP. Wait for user to answer ALL questions.**

---

### PHASE 3: Phase Breakdown

After user answers, propose the phase breakdown. **DO NOT create any files yet.**

**Read templates:**
- `.cursor/templates/_index.template.md`
- `.cursor/templates/phase-plan.template.md`

**Format your response:**

> 📋 **Feature: [Feature Name]**
>
> **Goal:** [From their answer to question 1]
> **Approach:** [TDD/Direct/Hybrid] [emoji]

---

### Proposed Phases

| # | Phase | Focus | Steps (est.) |
|---|-------|-------|--------------|
| 1 | **[Phase Name]** | [What this phase accomplishes] | ~[3-5] |
| 2 | **[Phase Name]** | [What this phase accomplishes] | ~[3-5] |
| 3 | **[Phase Name]** | [What this phase accomplishes] | ~[3-5] |

---

### Phase Details Preview

**Phase 1: [Name]**
- Step 1: [Specific action with file path]
- Step 2: [Specific action with file path]
- Step 3: [Specific action with file path]

**Phase 2: [Name]**
- Step 1: [Specific action with file path]
- Step 2: [Specific action with file path]
- Step 3: [Specific action with file path]

**Phase 3: [Name]**
- Step 1: [Specific action with file path]
- Step 2: [Specific action with file path]
- Step 3: [Specific action with file path]

---

> **This look right?**
>
> - ✅ **"approve"** - I will create deep plans for each phase
> - ✏️ **"change X to Y"** - I will adjust
> - 🔄 **"start over"** - Fresh start

**Phase Generation Rules:**

1. **Maximum 3-4 phases** - If more needed, feature is too big. Ask to split.
2. **Each phase is a logical layer:**
   - Data/Models layer
   - API/Logic layer
   - UI/Integration layer
   - (Optional) Polish/Edge cases layer
3. **Each phase should be independently verifiable**
4. **Phases build on each other** - Phase 2 depends on Phase 1, etc.

**⛔ STOP. Wait for user approval.**

---

### PHASE 4: Create Deep Plans

**ONLY after explicit approval ("approve", "yes", "looks good", "go", "lets do it")**

#### Step 1: Create Feature Folder Structure

```
memory-bank/features/active/[feature-name-kebab-case]/
├── _index.md
├── 01-[phase-1-slug].plan.md
├── 02-[phase-2-slug].plan.md
└── 03-[phase-3-slug].plan.md
```

#### Step 2: Create `_index.md`

Use `.cursor/templates/_index.template.md` structure.

Fill in:
- Feature overview
- Phase table with links
- Acceptance criteria
- Scope (in/out)
- Architecture decisions

#### Step 3: Create Phase Plans

For EACH phase, create a deep plan file using `.cursor/templates/phase-plan.template.md`.

**CRITICAL - Each phase plan MUST include:**

1. **Reference Section** - Patterns from system-patterns.md to follow
2. **Anti-Patterns** - What NOT to do (prevents hallucination)
3. **Code Skeletons** - 70% of code written, AI fills gaps
4. **Verification Commands** - How to prove each step worked
5. **Specific File Paths** - Exact files to create/modify

**Code Skeleton Requirements:**

- Include imports
- Include type definitions
- Include function signatures
- Include error handling structure
- Leave `// TODO: implement` for actual logic
- Include example usage/test cases

#### Step 4: Update Project Files

1. **Update `memory-bank/progress.md`** - Add to Roadmap:
   ```
   | [next #] | [Feature Name] | 🔨 Active | [Approach] |
   ```

2. **Update `memory-bank/active-context.md`** - Add:
   ```markdown
   ## Current Feature

   **Feature:** [Name]
   **Location:** `memory-bank/features/active/[name]/`
   **Status:** Phase 1, Step 0 - Not started
   **Next Action:** Execute Phase 1, Step 1
   ```

#### Step 5: Confirm

> ✅ **Feature structure created!**
>
> 📁 `memory-bank/features/active/[name]/`
> - `_index.md` - Master overview
> - `01-[phase].plan.md` - [Phase 1 name]
> - `02-[phase].plan.md` - [Phase 2 name]
> - `03-[phase].plan.md` - [Phase 3 name]
>
> **Ready to start Phase 1?**
>
> - **"yes"** - Begin Phase 1, Step 1
> - **"show plan"** - Display Phase 1 plan details
> - **"later"** - Save for next session

**⛔ STOP. Wait for user.**

---

### PHASE 5: Execute Phase Step

When user says "yes" or "continue":

1. **Read the current phase plan** to find current step
2. **Execute EXACTLY as specified** in the plan:
   - Use the code skeleton provided
   - Fill in the TODO sections
   - Follow the patterns referenced
   - Avoid the anti-patterns listed
3. **Run verification command** and show output
4. **Update phase plan:**
   - Check steps `[ ]` to `[x]`
   - Update Implementation Log
5. **Update `_index.md`** if phase progress changed

**Report:**

> ✅ **Phase [P], Step [S] Complete**
>
> **Done:** [What was accomplished]
> **Files:** [Files created/modified]
> **Verified:** [Verification result]
>
> ---
>
> **Next:** Phase [P], Step [S+1] - [Description]
>
> Continue? ("yes" / "pause" / "show plan")

**⛔ STOP. Wait for user.**

---

### PHASE 6: Phase Transition

When all steps in a phase are complete:

1. **Verify phase acceptance criteria** in the plan
2. **Update phase plan** with completion time
3. **Update `_index.md`:**
   - Mark phase as ✅ Done
   - Update current phase pointer
4. **Report:**

> 🎉 **Phase [P] Complete!**
>
> **Duration:** [Time]
> **Files Created:**
> - `path/to/file1.ts`
> - `path/to/file2.ts`
>
> ---
>
> **Ready for Phase [P+1]: [Name]?**
>
> - **"yes"** - Start Phase [P+1]
> - **"show plan"** - Review Phase [P+1] plan first
> - **"pause"** - Save progress for later

**⛔ STOP. Wait for user.**

---

## MODE B: Resume Feature

### PHASE 1: Show Status

Read `_index.md` in the active feature folder.

> 📍 **Resuming: [Feature Name]**
>
> | Status | Info |
> |--------|------|
> | Progress | Phase [P] of [T], Step [S] of [X] |
> | Approach | [TDD/Direct/Hybrid] |
> | Last done | [Last completed step] |
> | Next up | Phase [P], Step [S]: [Description] |
>
> ---
>
> **What would you like to do?**
>
> - **"continue"** - Execute next step
> - **"show plan"** - Display current phase plan
> - **"show index"** - Display feature overview
> - **"done"** - Complete and archive
> - **"abandon"** - Archive as incomplete

**⛔ STOP. Wait for user.**

---

### PHASE 2: Continue

Based on user choice:

- **"continue"**: Read phase plan, execute next step (follow Phase 5 from Mode A)
- **"show plan"**: Display current phase plan contents, then ask to continue
- **"show index"**: Display `_index.md`, then ask what to do
- **"done"**: Go to Mode C
- **"abandon"**: Archive with `[ABANDONED]-` prefix, update progress.md

---

## MODE C: Complete Feature

### PHASE 1: Verify

Check `_index.md` for:
- All phases marked ✅?
- All acceptance criteria checked?

**If incomplete:**

> ⚠️ **Not quite done yet:**
>
> **Missing phases:**
> - Phase [N]: [Status]
>
> **Missing acceptance criteria:**
> - [ ] [Criterion]
>
> ---
>
> Complete anyway?
> - **"yes, done"** - Archive as-is
> - **"no"** - Continue working

**If complete or user confirms:**

---

### PHASE 2: Archive

1. **Add completion data** to `_index.md`:
   ```markdown
   ## Completion

   **Completed:** [YYYY-MM-DD HH:MM]
   **Total Duration:** [Calculated from logs]
   **Summary:** [Brief summary of what was built]
   ```

2. **Move folder:**
   ```
   features/active/[name]/ → features/archive/[YYYY-MM-DD]-[name]/
   ```

3. **Update `progress.md`:**
   - Change status from 🔨 Active to ✅ Done
   - Add to Completed Features section

4. **Update `active-context.md`:**
   - Remove Current Feature section

5. **Celebrate:**

> 🎉 **Feature Complete: [Name]**
>
> | Metric | Value |
> |--------|-------|
> | Phases | [P]/[P] |
> | Total Steps | [S] |
> | Duration | ~[X]h [X]m |
> | Approach | [TDD/Direct/Hybrid] |
>
> **Archived:** `features/archive/[date]-[name]/`
>
> ---
>
> Whats next?
> - `/mb/feature` - Start another feature
> - `/mb/update-active-context` - Update project context

**⛔ STOP.**

---

## DEEP PLAN CREATION RULES

When creating phase plans, follow these rules to ensure low-tier models can execute perfectly:

### 1. Code Skeletons Must Be Prescriptive

**BAD (Too Vague):**
```
Create a user model with name and email fields.
```

**GOOD (Prescriptive):**
```typescript
// File: src/models/user.ts
import { z } from "zod"

export const UserSchema = z.object({
  id: z.string().uuid(),
  name: z.string().min(1).max(100),
  email: z.string().email(),
  createdAt: z.date(),
  updatedAt: z.date(),
})

export type User = z.infer<typeof UserSchema>

// TODO: Add createUser function that:
// 1. Validates input with UserSchema.omit({ id, createdAt, updatedAt })
// 2. Generates UUID for id
// 3. Sets createdAt and updatedAt to now
// 4. Returns User object
export const createUser = (input: unknown): User => {
  // TODO: implement
}
```

### 2. Anti-Patterns Prevent Hallucination

Always include what NOT to do:

```markdown
## Anti-Patterns (DO NOT DO)

1. ❌ **Do not use `any` types** - Always use proper TypeScript types
2. ❌ **Do not create new utility functions** - Use existing ones from `src/utils/`
3. ❌ **Do not add new dependencies** - Use whats in package.json
4. ❌ **Do not modify existing tests** - Only add new test files
```

### 3. Reference Existing Patterns

Always point to existing code:

```markdown
## Reference

**Follow this pattern from `src/api/posts.ts`:**
```typescript
export const getPosts = async (): Promise<Post[]> => {
  // This is how we structure API calls in this project
}
```

**Match this style for error handling.**
```

### 4. Verification Must Be Concrete

**BAD:**
```
Verify: Make sure it works
```

**GOOD:**
```bash
# Verification:
yarn test src/models/user.test.ts
# Expected: All tests pass, no type errors

yarn tsc --noEmit
# Expected: No compilation errors
```

---

## EXECUTION RULES

### For TDD Approach

Each implementation step follows Red-Green-Refactor:

1. **Red:** Write failing test
   > 📝 Creating test: `[test file path]`
   > [Show test code from skeleton]
   > Running: `[test command]`
   > Expected: ❌ FAIL (test written, no implementation)

2. **Green:** Write minimum code to pass
   > 📝 Implementing: `[implementation file path]`
   > [Show implementation code]
   > Running: `[test command]`
   > Expected: ✅ PASS

3. **Refactor:** Clean up if needed (optional)

### For Direct Approach

Execute step, then verify:

> 📝 Creating: `[file path]`
> [Show code]
> Verifying: [Build/lint/type-check command]
> Result: ✅ Success

### For Hybrid Approach

- Test critical business logic (TDD)
- Direct implement UI/glue code
- Mark which is which in the plan

---

## INTERRUPTION HANDLING

If user says "pause", "stop", "later", "gtg":

1. **Save progress:**
   - Ensure phase plan is updated with current step status
   - Add note to Implementation Log

2. **Update `active-context.md`:**
   ```markdown
   ## Current Feature

   **Feature:** [Name]
   **Status:** Paused at Phase [P], Step [S]
   **Resume:** Run `/mb/feature` to continue
   ```

3. **Respond:**
   > ⏸️ **Progress saved!**
   >
   > Stopped at: Phase [P], Step [S] - [Description]
   >
   > Run `/mb/feature` anytime to resume.

---

## ERROR HANDLING

If something fails during execution:

1. **Do not panic - Report clearly:**

   > ❌ **Phase [P], Step [S] hit an issue**
   >
   > **Error:** [What went wrong]
   > **Likely cause:** [Your analysis]
   >
   > **Options:**
   > - **"fix"** - I will attempt to fix
   > - **"skip"** - Mark as blocked, continue to next step
   > - **"help"** - Lets troubleshoot together

2. **Log the blocker** in phase plan:
   ```markdown
   ### Blockers
   - [ ] Step [S]: [Error description] - [timestamp]
   ```

---

## REMEMBER

✅ **DO:**
- Stop after each phase
- Wait for explicit user input
- Follow templates exactly
- Reference context files
- Update plans after each step
- Include code skeletons in plans
- Specify anti-patterns

❌ **DO NOT:**
- Answer your own questions
- Assume user approval
- Skip phases
- Create files before approval
- Continue without user input
- Create vague task lists
- Invent new patterns
