# Feature: {{FEATURE_NAME}}

> **Status:** 🔨 Step 1 of {{TOTAL_STEPS}} | **TDD:** {{TDD_MODE}} | **Started:** {{DATE}}

---

## Context Snapshot

> Captured at blueprint creation - reference when resuming

**Architecture**: {{ARCHITECTURE_TYPE}}
**Key Patterns Used**: {{RELEVANT_PATTERNS}}
**Related Files**:
{{#each RELATED_FILES}}

- `{{FILE_PATH}}`
  {{/each}}
  **Dependencies Touched**: {{DEPENDENCIES}}

---

## Spec

**Goal:** {{GOAL_STATEMENT}}

### Requirements (EARS)

{{#each REQUIREMENTS}}

- **{{EARS_TYPE}}**: {{REQUIREMENT_TEXT}}
  {{/each}}

### Edge Cases

{{#each EDGE_CASES}}

- [ ] {{EDGE_CASE}}
      {{/each}}

---

## Plan

{{#if TDD_ENABLED}}
_TDD Mode: Tests written before implementation_

| Step | Test Type | Scope |
| ---- | --------- | ----- |

{{#each TEST_STEPS}}
| {{STEP_NUMBER}} | {{TEST_TYPE}} | `{{SCOPE}}` |
{{/each}}
{{/if}}

{{#each STEPS}}

- [ ] {{STEP_NUMBER}}. **{{STEP_TYPE}}**: {{STEP_DESCRIPTION}} {{CONFIDENCE}}
      {{/each}}

> **Confidence Legend**: 🟢 High | 🟡 Medium (needs verification) | 🔴 Low (needs clarification)

---

## Acceptance Criteria

{{#each ACCEPTANCE_CRITERIA}}

- [ ] {{CRITERION}}
      {{/each}}

---

## Decisions

| Decision | Options Considered | Chosen | Rationale |
| -------- | ------------------ | ------ | --------- |

{{#each DECISIONS}}
| {{DECISION}} | {{OPTIONS}} | {{CHOSEN}} | {{RATIONALE}} |
{{/each}}

---

## Blockers & Questions

<!-- Add during implementation -->
<!-- ❓ = Question | 🚧 = Blocked | ✅ = Resolved -->

---

## Flow Diagram

{{#if COMPLEX_FEATURE}}

```mermaid
flowchart LR
    {{MERMAID_FLOW}}
```

{{else}}

<!-- Add diagram if feature becomes complex -->

{{/if}}

---

## Log

### Step 1: {{STEP_1_NAME}} 🔨

- Started: {{DATE}}
- Working on: ...

<!--
Log entry format after completion:
### Step N: [Name] ✅ (YYYY-MM-DD)
- What was done
- Decisions made
- Any blockers encountered
- Time spent: ~Xh Xm
-->

---

## Metrics

<!-- Auto-filled on completion -->

| Metric               | Value             |
| -------------------- | ----------------- |
| Total time           | -                 |
| Steps completed      | 0/{{TOTAL_STEPS}} |
| Tests written        | -                 |
| Files modified       | -                 |
| Blockers encountered | 0                 |

---

## Completion

<!-- Filled by /mb/feature done -->

**Completed:** -
**Duration:** -
**Final Status:** ⏳ In Progress

> Summary: -
