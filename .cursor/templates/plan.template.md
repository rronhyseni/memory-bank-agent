# {{FEATURE_NAME}} - Execution Plan

> **Status:** 🔨 Step {{CURRENT_STEP}}/{{TOTAL_STEPS}} | **Started:** {{DATE}}

---

## Context

**Goal:** {{GOAL_DESCRIPTION}}

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

**What:** {{CLEAR_DESCRIPTION_OF_WHAT_TO_BUILD_NO_CODE}}

**Pattern:** Follow `{{REFERENCE_FILE}}` for structure

**Verify:**

```bash
{{VERIFICATION_COMMAND}}
```

→ Expected: {{EXPECTED_OUTPUT}}

- [ ] Done

---

### Step 2: {{STEP_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What:** {{CLEAR_DESCRIPTION_OF_WHAT_TO_BUILD_NO_CODE}}

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

**What:** {{CLEAR_DESCRIPTION_OF_WHAT_TO_BUILD_NO_CODE}}

**Pattern:** Follow `{{REFERENCE_FILE}}`

**Verify:**

```bash
{{VERIFICATION_COMMAND}}
```

→ Expected: {{EXPECTED_OUTPUT}}

- [ ] Done

---

<!-- Add more steps as needed, same format -->

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
