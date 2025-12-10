# Active Context

_Last updated: {{TIMESTAMP}}_

## Current Task or Feature In Progress

**{{CURRENT_TASK_TITLE}}** - {{CURRENT_TASK_STATUS}}

{{CURRENT_TASK_SUMMARY}}

- {{CURRENT_TASK_DETAIL_1}}
- {{CURRENT_TASK_DETAIL_2}}
- {{CURRENT_TASK_DETAIL_3}}

## Relevant Background Context

- **Branch**: {{BRANCH_NAME}}
- **Modified Files**:
  {{#each MODIFIED_FILES}}
- `{{PATH}}` {{STATUS}}
  {{/each}}

- **Memory Bank Status**: {{MEMORY_BANK_STATUS}}
- **Project Structure**: {{PROJECT_STRUCTURE_SUMMARY}}

## Next Steps / To-Do / Open Questions / Blockers

{{#each NEXT_ITEMS}}

- [{{CHECKBOX}}] {{TEXT}}
  {{/each}}

**Note**: Update this file after each significant session or at the start of a new task to keep the active context accurate and useful.
