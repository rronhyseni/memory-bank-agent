# Project Brief

## Project Identity

**Name**: {{PROJECT_NAME}}

**Type**: {{PROJECT_TYPE}}

<!-- Examples: SaaS Platform, E-commerce, Mobile App, API Service, Developer Tool, Marketplace, etc. -->

**Architecture**: {{ARCHITECTURE}}

<!-- Examples: Monorepo (Turborepo), Microservices, Monolith, Serverless, Jamstack, etc. -->

**Codebase**: {{CODEBASE_IDENTIFIER}}

<!-- Repository name or identifier -->

---

## Core Purpose

{{CORE_PURPOSE}}

<!--
Write 2-3 paragraphs that answer:
- What problem does this project solve?
- Who are the primary users/stakeholders?
- What is the unique value proposition?
- How does the platform/product work at a high level?
-->

---

## Primary Goals

{{#each PRIMARY_GOALS}}
{{@index}}. **{{GOAL_TITLE}}**

- {{GOAL_DESCRIPTION}}
  {{/each}}

<!--
List 4-8 primary goals. Each goal should:
- Have a clear, action-oriented title
- Include a brief description of what success looks like
- Be measurable or observable
-->

---

## Key Requirements

### Functional Requirements

{{#each FUNCTIONAL_REQUIREMENTS}}

- **{{REQUIREMENT_NAME}}**: {{REQUIREMENT_DESCRIPTION}}
  {{/each}}

<!--
List core features and capabilities. For each:
- Use bold feature name followed by description
- Include specific details (e.g., "max 10 per user", specific workflow steps)
- Group related functionality together
-->

### Non-Functional Requirements

{{#each NON_FUNCTIONAL_REQUIREMENTS}}

- **{{NFR_NAME}}**: {{NFR_DESCRIPTION}}
  {{/each}}

<!--
Cover these categories as applicable:
- Scalability, Performance, Security, Reliability
- Responsiveness, Accessibility, Content Quality
- User Experience, Compliance, Observability
-->

---

## Technology Foundation

{{#each TECH_CATEGORIES}}

- **{{CATEGORY}}**: {{TECHNOLOGIES}}
  {{/each}}

<!--
Standard categories to include:
- Backend, Frontend, Admin/Dashboard, Mobile (if applicable)
- Infrastructure, Authentication, Storage, Email/Notifications
- Payment (if applicable), Quality/Testing, CI/CD
-->

---

## Project Scope

### In Scope

{{#each IN_SCOPE_ITEMS}}

- {{ITEM}}
  {{/each}}

### Out of Scope

{{#each OUT_OF_SCOPE_ITEMS}}

- {{ITEM}}
  {{/each}}

### Recently Removed

{{#if RECENTLY_REMOVED}}
{{#each RECENTLY_REMOVED}}

- {{ITEM}} (removed: {{DATE}}, reason: {{REASON}})
  {{/each}}
  {{else}}
  _No features have been recently removed._
  {{/if}}

---

## Success Criteria

{{#each SUCCESS_CRITERIA}}
{{@index}}. **{{ACTOR}}** can {{CAPABILITY}}
{{/each}}

<!--
Format: "[User type] can [achieve specific outcome]"
Cover all user types: end users, business users, admins, etc.
Include platform-level success criteria
-->

---

## Project Status

- **Stage**: {{PROJECT_STAGE}}
<!-- Examples: Planning, Active Development, Beta, Production, Maintenance -->

- **Active Work**: {{ACTIVE_WORK}}

- **Recent Changes**: {{RECENT_CHANGES}}

- **Next Phase**: {{NEXT_PHASE}}

---

## Constraints

{{#each CONSTRAINTS}}

- **{{CONSTRAINT_TYPE}}**: {{CONSTRAINT_DESCRIPTION}}
  {{/each}}

<!--
Include:
- Technical constraints (versions, tools, platforms)
- Business constraints (limits, quotas, requirements)
- Operational constraints (workflows, approvals)
- Performance constraints (SLAs, benchmarks)
-->

---

## Repository Structure
