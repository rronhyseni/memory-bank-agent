# Feature: {{FEATURE_NAME}}

> **Status:** {{STATUS_EMOJI}} {{CURRENT_STATUS}} | **Started:** {{DATE}}

---

## Overview

**Goal:** {{ONE_SENTENCE_GOAL}}

**Success Criteria:** {{WHAT_MUST_WORK_FOR_DONE}}

**Approach:** {{TDD/Direct/Hybrid}} {{APPROACH_EMOJI}}

---

## Plan

| Plan                 | Focus          | Status                           | Progress      |
| -------------------- | -------------- | -------------------------------- | ------------- |
| [plan.md](./plan.md) | {{PLAN_FOCUS}} | {{🔵 Planned/🔨 Active/✅ Done}} | {{0/X steps}} |

<!-- Optional second plan (only for very large / two-layer features):
| [plan-2.md](./plan-2.md) | {{PLAN_2_FOCUS}} | {{🔵 Planned/✅ Done}} | {{0/X steps}} |
-->

---

## Acceptance Criteria

> Feature is complete when ALL are checked

- [ ] {{CRITERION_1}}
- [ ] {{CRITERION_2}}
- [ ] {{CRITERION_3}}

---

## Scope

**In Scope:**

- {{IN_SCOPE_1}}
- {{IN_SCOPE_2}}

**Out of Scope:**

- {{OUT_OF_SCOPE_1}}
- {{OUT_OF_SCOPE_2}}

---

## Files

**Will Create/Modify:**

```
{{FILE_TREE_PREVIEW}}
```

**Must NOT Touch:**

- {{PROTECTED_FILE_1}}

---

## Progress Log

| Step | Description | Status | Completed |
| ---- | ----------- | ------ | --------- |
| 1    | {{STEP_1}}  | ⬚      | -         |
| 2    | {{STEP_2}}  | ⬚      | -         |
| 3    | {{STEP_3}}  | ⬚      | -         |

<!-- Status: ⬚ Pending | 🔨 Active | ✅ Done | ⏭️ Skipped -->

---

## Completion

<!-- Filled when feature is done -->

**Completed:** -

**Duration:** -

**Summary:** -

---

## `plan.template.md`

````markdown
# {{FEATURE_NAME}} - Execution Plan

> **Status:** 🔨 Step 0/{{TOTAL_STEPS}} | **Started:** {{DATE}}

---

## Context

**Goal:** {{PHASE_GOAL_DESCRIPTION}}

**Approach:** {{TDD/Direct/Hybrid}}

**Prerequisites:**

- {{REQUIRED_CONTEXT}}

---

## Reference

> Follow these patterns. Do NOT invent new ones.

**Patterns to follow:**

- `{{SIMILAR_FILE_PATH}}` - match this structure
- `{{ANOTHER_REFERENCE}}` - match this style

**From `tech-context.md`:**

- Framework: {{FRAMEWORK}}
- Key deps: {{DEPENDENCIES}}
- Commands: `{{BUILD_TEST_COMMANDS}}`

---

## Anti-Patterns

> Avoid these mistakes

1. ❌ **{{ANTI_PATTERN_1}}** - {{WHY_BAD}}
2. ❌ **{{ANTI_PATTERN_2}}** - {{WHY_BAD}}
3. ❌ **{{ANTI_PATTERN_3}}** - {{WHY_BAD}}

---

## Steps

### Step 1: {{STEP_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What:** {{CLEAR_DESCRIPTION_OF_WHAT_TO_BUILD}}

**Pattern:** Follow `{{REFERENCE_FILE}}` for structure

**Verify:**

```bash
{{VERIFICATION_COMMAND}}
```
````

→ Expected: {{EXPECTED_OUTPUT}}

- [ ] Done

---

### Step 2: {{STEP_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What:** {{CLEAR_DESCRIPTION}}

**Pattern:** Follow `{{REFERENCE_FILE}}`

**Verify:**

```bash
{{VERIFICATION_COMMAND}}
```

→ Expected: {{EXPECTED_OUTPUT}}

- [ ] Done

---

### Step 3: {{STEP_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What:** {{CLEAR_DESCRIPTION}}

**Pattern:** Follow `{{REFERENCE_FILE}}`

**Verify:**

```bash
{{VERIFICATION_COMMAND}}
```

→ Expected: {{EXPECTED_OUTPUT}}

- [ ] Done

---

<!-- Add more steps as needed, same format -->

---

## Edge Cases

- [ ] {{EDGE_CASE_1}} - handled in Step {{N}}
- [ ] {{EDGE_CASE_2}} - handled in Step {{N}}

---

## Completion Checklist

- [ ] All steps done
- [ ] All verifications passed
- [ ] No linter/type errors
- [ ] Matches existing patterns
- [ ] `_index.md` updated

---

## Notes

<!-- Runtime notes, blockers, decisions -->

```

---

## Key Changes Made

| Aspect | Before | After |
|--------|--------|-------|
| **Phase table** | 3 phase files | 1 plan (2 max) |
| **Code skeletons** | 70% code in plan | Removed - describe intent only |
| **Step format** | Verbose with fill-in lists | Clean: What, Pattern, Verify |
| **Implementation log** | Separate section per step | Simple table in `_index.md` |
| **Dependencies/Risks** | Full sections | Removed (overkill for most features) |
| **Template length** | ~150 lines each | ~80 lines each |

The templates are now **half the size** but contain the same essential information. The focus is on **what to build and how to verify**, not on writing code upfront.
```
