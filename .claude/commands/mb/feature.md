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
8. **NO META NARRATION** - Do NOT output internal commentary like:
   - "I'm going to check…"
   - "Next I'll…"
   - "Let me load/read…"
     If a step says "read silently", do it and **do not mention it** in your reply.

---

## MODE DETECTION

First, check `memory-bank/features/active/` directory:

- **Empty or does not exist?** → Start New Feature (Mode A)
- **Has a feature folder?** → Resume Feature (Mode B)
- **User said "done"?** → Complete Feature (Mode C)

---

## MODE A: Start New Feature

### PHASE 1: Discovery

**AI Instructions:**

1. Silently read the memory bank to get initial context (do not mention reading):
   - `memory-bank/project-brief.md`
   - `memory-bank/product-context.md`
   - `memory-bank/tech-context.md`
   - `memory-bank/system-patterns.md`
   - `memory-bank/active-context.md`
   - `memory-bank/progress.md`
2. If any files don't exist, continue anyway without mentioning it
3. This initial read helps you understand the project before asking questions
4. Output ONLY the text below to the user
5. STOP and wait for user response

**Output to user:**

```
🎯 **What feature are you building?**

Describe what it should do in your own words.
```

---

### PHASE 2: Clarifying Questions

**AI Instructions:**

1. After user describes the feature, FIRST read the entire memory bank silently (do not mention reading):
   - `memory-bank/project-brief.md`
   - `memory-bank/product-context.md`
   - `memory-bank/tech-context.md`
   - `memory-bank/system-patterns.md`
   - `memory-bank/active-context.md`
   - `memory-bank/progress.md`
   - Any other relevant files in `memory-bank/`
2. Use this context to ask ONLY 3-4 targeted, NON-REDUNDANT questions
3. DO NOT ask about things already documented in memory-bank
4. Focus questions on:
   - Specific acceptance criteria for THIS feature
   - Ambiguities not covered in existing docs
   - User preferences for THIS implementation
5. Output the format below, filling in placeholders with context-aware questions
6. STOP and wait for user to answer ALL questions

**Output to user:**

```
> Got it! You want to build **[one-sentence summary of their feature]**.

Quick questions to nail the spec:

1. **Success:** What is the ONE thing that must work for this to be "done"?

2. **Scope:** [Context-specific question based on their description and memory-bank context - ask about ambiguities or specifics not covered in docs]

3. **Approach:** How do you want to build this?
   - 🧪 **TDD** - Tests first, then code (recommended for logic-heavy features)
   - 🚀 **Direct** - Code first, tests after (faster for UI/prototypes)
   - ⚡ **Hybrid** - Tests for critical paths only

4. **Constraints:** Anything to avoid or must-use? (say "none" to skip)
```

---

### PHASE 3: Phase Breakdown

**AI Instructions:**

1. After user answers, propose the phase breakdown
2. DO NOT create any files yet
3. Silently read templates (don't mention it):
   - `.cursor/templates/_index.template.md`
   - `.cursor/templates/phase-plan.template.md`
4. Follow Phase Generation Rules below
5. Output the format below to user
6. STOP and wait for user approval

**Phase Generation Rules:**

- **Maximum 3-4 phases** - If more needed, feature is too big. Ask to split.
- **Each phase is a logical layer:**
  - Data/Models layer
  - API/Logic layer
  - UI/Integration layer
  - (Optional) Polish/Edge cases layer
- **Each phase should be independently verifiable**
- **Phases build on each other** - Phase 2 depends on Phase 1, etc.

**Output to user:**

```
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
```

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

**AI Instructions:**

1. After creating all files, output confirmation below
2. STOP and wait for user response

**Output to user:**

```
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
```

---

### PHASE 5: Execute Phase Step

**AI Instructions:**

1. When user says "yes" or "continue", execute the following:
   - Read the current phase plan to find current step
   - Execute EXACTLY as specified in the plan:
     - Use the code skeleton provided
     - Fill in the TODO sections
     - Follow the patterns referenced
     - Avoid the anti-patterns listed
   - Run verification command and show output
   - Update phase plan:
     - Check steps `[ ]` to `[x]`
     - Update Implementation Log
   - Update `_index.md` if phase progress changed
2. Output report below to user
3. STOP and wait for user response

**Output to user:**

```
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
```

---

### PHASE 6: Phase Transition

**AI Instructions:**

1. When all steps in a phase are complete:
   - Verify phase acceptance criteria in the plan
   - Update phase plan with completion time
   - Update `_index.md`:
     - Mark phase as ✅ Done
     - Update current phase pointer
2. Output report below to user
3. STOP and wait for user response

**Output to user:**

```
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
```

---

## MODE B: Resume Feature

### PHASE 1: Show Status

**AI Instructions:**

1. Read `_index.md` in the active feature folder
2. Output status below to user
3. STOP and wait for user response

**Output to user:**

```
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
```

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

**AI Instructions:**

1. Check `_index.md` for:
   - All phases marked ✅?
   - All acceptance criteria checked?
2. If incomplete, output warning below and wait for confirmation
3. If complete or user confirms, proceed to PHASE 2

**If incomplete, output to user:**

```
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
```

**If complete or user confirms, proceed to PHASE 2:**

---

### PHASE 2: Archive

**AI Instructions:**

1. Add completion data to `_index.md`:

   ```markdown
   ## Completion

   **Completed:** [YYYY-MM-DD HH:MM]
   **Total Duration:** [Calculated from logs]
   **Summary:** [Brief summary of what was built]
   ```

2. Move folder:

   ```
   features/active/[name]/ → features/archive/[YYYY-MM-DD]-[name]/
   ```

3. Update `progress.md`:

   - Change status from 🔨 Active to ✅ Done
   - Add to Completed Features section

4. Update `active-context.md`:

   - Remove Current Feature section

5. Output celebration message below
6. STOP

**Output to user:**

```
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
```

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
import { z } from 'zod';

export const UserSchema = z.object({
  id: z.string().uuid(),
  name: z.string().min(1).max(100),
  email: z.string().email(),
  createdAt: z.date(),
  updatedAt: z.date(),
});

export type User = z.infer<typeof UserSchema>;

// TODO: Add createUser function that:
// 1. Validates input with UserSchema.omit({ id, createdAt, updatedAt })
// 2. Generates UUID for id
// 3. Sets createdAt and updatedAt to now
// 4. Returns User object
export const createUser = (input: unknown): User => {
  // TODO: implement
};
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

````markdown
## Reference

**Follow this pattern from `src/api/posts.ts`:**

```typescript
export const getPosts = async (): Promise<Post[]> => {
  // This is how we structure API calls in this project
};
```
````

**Match this style for error handling.**

```

### 4. Verification Must Be Concrete

**BAD:**
```

Verify: Make sure it works

````

**GOOD:**
```bash
# Verification:
yarn test src/models/user.test.ts
# Expected: All tests pass, no type errors

yarn tsc --noEmit
# Expected: No compilation errors
````

---

## EXECUTION RULES

### For TDD Approach

Each implementation step follows Red-Green-Refactor:

1. **Red:** Write failing test

   > 📝 Creating test: `[test file path]` > [Show test code from skeleton]
   > Running: `[test command]`
   > Expected: ❌ FAIL (test written, no implementation)

2. **Green:** Write minimum code to pass

   > 📝 Implementing: `[implementation file path]` > [Show implementation code]
   > Running: `[test command]`
   > Expected: ✅ PASS

3. **Refactor:** Clean up if needed (optional)

### For Direct Approach

Execute step, then verify:

> 📝 Creating: `[file path]` > [Show code]
> Verifying: [Build/lint/type-check command]
> Result: ✅ Success

### For Hybrid Approach

- Test critical business logic (TDD)
- Direct implement UI/glue code
- Mark which is which in the plan

---

## INTERRUPTION HANDLING

**AI Instructions:**
When user says "pause", "stop", "later", "gtg":

1. Save progress:

   - Ensure phase plan is updated with current step status
   - Add note to Implementation Log

2. Update `active-context.md`:

   ```markdown
   ## Current Feature

   **Feature:** [Name]
   **Status:** Paused at Phase [P], Step [S]
   **Resume:** Run `/mb/feature` to continue
   ```

3. Output response below to user

**Output to user:**

```
> ⏸️ **Progress saved!**
>
> Stopped at: Phase [P], Step [S] - [Description]
>
> Run `/mb/feature` anytime to resume.
```

---

## ERROR HANDLING

**AI Instructions:**
If something fails during execution:

1. Do not panic - report clearly using format below
2. Log the blocker in phase plan:
   ```markdown
   ### Blockers

   - [ ] Step [S]: [Error description] - [timestamp]
   ```
3. Wait for user to choose an option

**Output to user:**

```
> ❌ **Phase [P], Step [S] hit an issue**
>
> **Error:** [What went wrong]
> **Likely cause:** [Your analysis]
>
> **Options:**
> - **"fix"** - I will attempt to fix
> - **"skip"** - Mark as blocked, continue to next step
> - **"help"** - Lets troubleshoot together
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
