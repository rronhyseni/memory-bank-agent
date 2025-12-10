# Tech Context

## Core Tech Stack

### Backend ({{BACKEND_PATH}})

**Framework & Runtime**

- **{{BACKEND_FRAMEWORK}}** {{VERSION}} - {{DESCRIPTION}}
- **{{RUNTIME}}** {{VERSION}} - {{DESCRIPTION}}
- **TypeScript** {{VERSION}} - Static typing

**Database & ORM**

- **{{ORM}}** {{VERSION}} - {{DESCRIPTION}}
- **{{DATABASE}}** - Primary database

**Authentication & Authorization**

<!-- List auth libraries with versions and descriptions -->

**API Documentation**

<!-- List API doc tools if applicable -->

**Validation**

<!-- List validation libraries -->

**Testing**

<!-- List test frameworks and tools -->

**Code Quality**

<!-- List linting, formatting tools -->

### Frontend ({{FRONTEND_PATH}})

**Framework**

- **{{FRONTEND_FRAMEWORK}}** {{VERSION}} - {{DESCRIPTION}}
- **{{UI_LIBRARY}}** {{VERSION}} - UI library
- **TypeScript** {{VERSION}} - Static typing

**UI & Styling**

<!-- List UI/styling libraries -->

**State Management**

<!-- List state management libraries -->

**Forms & Validation**

<!-- List form libraries -->

### Shared Packages

<!-- If monorepo, list shared packages -->

### Monorepo Tools (if applicable)

<!-- List build system, package manager details -->

## Dev Environment & Tooling

### Prerequisites

1. **{{RUNTIME}}**: Use version from `.nvmrc` ({{VERSION}})

```bash
# Installation commands
```

{{PACKAGE_MANAGER}}: {{INSTALLATION_INSTRUCTIONS}}

Docker (if applicable): For local services

Setup Commands

# Install dependencies

{{INSTALL_COMMAND}}

# Setup local environment

{{SETUP_COMMAND}}

# Start development servers

{{DEV_COMMAND}}

Development Workflow

# Backend development

{{BACKEND_DEV_COMMANDS}}

# Frontend development

{{FRONTEND_DEV_COMMANDS}}

# Code quality

{{QUALITY_COMMANDS}}

Configuration
Environment Variables

<!-- Describe env var setup without exposing secrets -->

Database Configuration

<!-- Describe database setup -->

Code Generation (if applicable)

<!-- Describe any code generation workflows -->

Standards & Constraints
Hard Requirements
{{RUNTIME}}: {{VERSION_REQUIREMENT}}
Package Manager: {{PACKAGE_MANAGER}} only
Database: {{DATABASE}}

<!-- Add other hard requirements -->

Code Standards
TypeScript: {{TS_CONFIG}}
Formatting: {{FORMATTER}}
Linting: {{LINTER}}
Testing: {{TEST_FRAMEWORK}}

<!-- Add other code standards -->

Code Generation Boundaries (if applicable)

<!-- Describe auto-generated files that shouldn't be edited -->

Styling Standards

<!-- Describe CSS/styling approach -->

Performance Considerations

<!-- List key performance requirements -->

Security Requirements

<!-- List security requirements -->

Infrastructure / External Services Summary
Storage

<!-- List storage services -->

Email

<!-- List email services -->

Authentication

<!-- List auth providers -->

Payment (if applicable)

<!-- List payment providers -->

Database

<!-- Production database details -->

Monitoring & Observability

<!-- List monitoring tools -->

Development Tools

<!-- List dev tools -->

---

## 3. Shape Command for System Patterns

**File: `.cursor/commands/mb/shape-system-patterns.md`**

```markdown
---
description: Generate or update the System Patterns document for the memory bank
---

# Shape System Patterns

You are a software architect documentation specialist. Your task is to gather information about the project's architecture and patterns, then generate a comprehensive `systemPatterns.md` file.

## Instructions

1. **Ask the following questions ONE AT A TIME** - wait for user response before proceeding
2. **Keep questions minimal** - the AI should do the heavy lifting based on answers
3. **After all questions are answered**, generate the complete document using the template
4. **Save the output** to `memory-bank/systemPatterns.md`

---

## Questions to Ask

### Q1: Architecture Type

"What is your overall architecture? (e.g., 'Monorepo with separate API and frontend apps' or 'Single Next.js fullstack app' or 'Microservices')"

### Q2: Backend Pattern

"How is your backend organized? (e.g., 'Domain-driven modules with repository pattern' or 'MVC with services' or 'Serverless functions')"

### Q3: Frontend Pattern

"How is your frontend organized? (e.g., 'Feature-based folders with shared components' or 'Atomic design' or 'Page-based with hooks')"

### Q4: Data Flow

"How does data flow through your app? (e.g., 'REST API → React Query → Components' or 'GraphQL → Apollo → Components' or 'Server Components + Server Actions')"

### Q5: Key Design Decisions

"What are 2-3 important architectural decisions in your project? (e.g., 'Prisma over TypeORM for type safety' or 'Zustand over Redux for simplicity')"

### Q6: Critical Patterns

"Are there any patterns that MUST be followed? (e.g., 'All pages must use AdminLayout' or 'All API calls through generated hooks')"

---

## Generation Instructions

After gathering answers:

1. **Read the template** from `.cursor/templates/system-patterns.template.md`
2. **Analyze the codebase** - examine folder structure, imports, key files
3. **Identify patterns** from existing code that the user didn't mention
4. **Generate code examples** based on actual patterns found in the codebase
5. **Generate a complete document** following the template structure
6. **Save to** `memory-bank/systemPatterns.md`

If `memory-bank/systemPatterns.md` already exists, ask the user if they want to:

- **Update**: Merge new information with existing content
- **Replace**: Generate fresh from answers
- **Cancel**: Keep existing file

---

## Template Location

Use template: `.cursor/templates/system-patterns.template.md`

## Output Location

Save to: `memory-bank/systemPatterns.md`
```
