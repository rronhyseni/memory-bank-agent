# Phase {{PHASE_NUMBER}}: {{PHASE_NAME}}

> **Feature:** {{FEATURE_NAME}} | **Status:** 🔨 Step 0/{{TOTAL_STEPS}} | **Started:** {{DATE}}

---

## Phase Context

**What this phase accomplishes:**
{{PHASE_GOAL_DESCRIPTION}}

**Prerequisites:**

- {{PREVIOUS_PHASE_IF_ANY}} must be complete
- {{REQUIRED_CONTEXT}}

**Files from previous phases:**

```
{{FILES_CREATED_IN_PREVIOUS_PHASES}}
```

---

## Reference (Read Before Executing)

> These patterns/files MUST be followed. Do NOT invent new patterns.

**From `system-patterns.md`:**

```
{{RELEVANT_PATTERN_SNIPPET}}
```

**From `tech-context.md`:**

- Framework: {{FRAMEWORK}}
- Key Dependencies: {{DEPENDENCIES}}
- Commands: {{BUILD_TEST_COMMANDS}}

**Similar existing code to match:**

- `{{SIMILAR_FILE_PATH}}` - follow this style

---

## Anti-Patterns (DO NOT DO)

> These mistakes will break the implementation

1. ❌ **{{ANTI_PATTERN_1}}** - {{WHY_BAD}}
2. ❌ **{{ANTI_PATTERN_2}}** - {{WHY_BAD}}
3. ❌ **{{ANTI_PATTERN_3}}** - {{WHY_BAD}}

---

## Steps

### Step 1: {{STEP_1_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What to do:**
{{DETAILED_DESCRIPTION_OF_WHAT_TO_IMPLEMENT}}

**Code skeleton:**

```{{LANGUAGE}}
{{CODE_SKELETON_70_PERCENT_COMPLETE}}
```

**Fill in:**

- [ ] {{SPECIFIC_THING_TO_IMPLEMENT_1}}
- [ ] {{SPECIFIC_THING_TO_IMPLEMENT_2}}

**Verification:**

```bash
{{VERIFICATION_COMMAND}}
```

Expected: {{EXPECTED_OUTPUT}}

**✅ Completion Checklist:**

- [ ] File created/updated
- [ ] Follows pattern from system-patterns.md
- [ ] Verification passed

---

### Step 2: {{STEP_2_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What to do:**
{{DETAILED_DESCRIPTION}}

**Code skeleton:**

```{{LANGUAGE}}
{{CODE_SKELETON}}
```

**Fill in:**

- [ ] {{SPECIFIC_THING_1}}
- [ ] {{SPECIFIC_THING_2}}

**Verification:**

```bash
{{VERIFICATION_COMMAND}}
```

Expected: {{EXPECTED_OUTPUT}}

**✅ Completion Checklist:**

- [ ] File created/updated
- [ ] Follows pattern from system-patterns.md
- [ ] Verification passed

---

### Step 3: {{STEP_3_NAME}}

**Action:** {{CREATE/UPDATE/DELETE}} `{{FILE_PATH}}`

**What to do:**
{{DETAILED_DESCRIPTION}}

**Code skeleton:**

```{{LANGUAGE}}
{{CODE_SKELETON}}
```

**Fill in:**

- [ ] {{SPECIFIC_THING_1}}
- [ ] {{SPECIFIC_THING_2}}

**Verification:**

```bash
{{VERIFICATION_COMMAND}}
```

Expected: {{EXPECTED_OUTPUT}}

**✅ Completion Checklist:**

- [ ] File created/updated
- [ ] Follows pattern from system-patterns.md
- [ ] Verification passed

---

## Phase Acceptance

> All must be checked before moving to next phase

- [ ] All steps completed
- [ ] All verifications passed
- [ ] No linter/type errors introduced
- [ ] Code matches existing patterns
- [ ] `_index.md` updated with phase completion

---

## Edge Cases Handled

- [ ] {{EDGE_CASE_1}} - handled in Step {{N}}
- [ ] {{EDGE_CASE_2}} - handled in Step {{N}}

---

## Implementation Log

### Step 1: {{STEP_1_NAME}}

- **Started:** -
- **Completed:** -
- **Notes:** -

### Step 2: {{STEP_2_NAME}}

- **Started:** -
- **Completed:** -
- **Notes:** -

### Step 3: {{STEP_3_NAME}}

- **Started:** -
- **Completed:** -
- **Notes:** -

---

## Phase Completion

**Completed:** -
**Duration:** -
**Files Created/Modified:**

- `{{FILE_1}}`
- `{{FILE_2}}`

**Handoff to Next Phase:**
{{WHAT_NEXT_PHASE_NEEDS_TO_KNOW}}

