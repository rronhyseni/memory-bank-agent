---
description: Generate or update the System Patterns document for the memory bank
output: memory-bank/system-patterns.md
---

# Shape System Patterns

You are a software architect documentation specialist. Your task is to gather information about the project's architecture and patterns, then generate a comprehensive `system-patterns.md` file.

## Instructions

1. **Ask the following questions ONE AT A TIME** - wait for user response before proceeding
2. **Keep questions minimal** - the AI should do the heavy lifting based on answers
3. **Analyze the codebase** to infer patterns the user doesn't mention
4. **After all questions are answered**, generate the complete document using the template
5. **Save the output** to `memory-bank/system-patterns.md`

---

## Questions to Ask

### Q1: Architecture Type

"What is your overall architecture? (e.g., 'Monorepo with separate API and frontend apps' or 'Single Next.js fullstack app' or 'Microservices')"

### Q2: Backend Pattern

"How is your backend organized? (e.g., 'Domain-driven modules with repository pattern' or 'MVC with services' or 'Serverless functions')"

### Q3: Frontend Pattern

"How is your frontend organized? (e.g., 'Feature-based folders with shared components' or 'Atomic design' or 'Page-based with hooks')"

### Q4: Data Flow

"How does data flow through your app? (e.g., 'REST API with React Query' or 'GraphQL with Apollo' or 'Server Components with Server Actions')"

### Q5: Key Design Decisions

"What are 2-3 important architectural decisions in your project? (e.g., 'Prisma over TypeORM for type safety' or 'Zustand over Redux for simplicity')"

### Q6: Critical Patterns

"Are there any patterns that MUST be followed? (e.g., 'All pages must use PageLayout' or 'All API calls through generated hooks')"

---

## Generation Instructions

After gathering answers:

1. **Read the template** from `.cursor/templates/system-patterns.template.md`
2. **Analyze the codebase**:
   - Examine folder structure and naming conventions
   - Look at import patterns and dependencies
   - Study existing modules/components for patterns
   - Check for shared utilities and their usage
3. **Identify patterns** from existing code that the user didn't explicitly mention
4. **Generate real code examples** based on actual patterns found in the codebase
5. **Create architecture diagrams** using ASCII art that reflect the actual structure
6. **Generate a complete document** following the template structure
7. **Save to** `memory-bank/system-patterns.md`

### Important Guidelines

- **Use actual code examples** from the codebase, not generic placeholders
- **Include ASCII diagrams** for architecture visualization
- **Document both required patterns and recommended patterns**
- **Explain the "why" behind each pattern**, not just the "what"
- **Include refactoring guidelines** - when to create new modules vs extend existing

If `memory-bank/system-patterns.md` already exists, ask the user if they want to:

- **Update**: Merge new information with existing content
- **Replace**: Generate fresh from answers
- **Cancel**: Keep existing file

---

## Template Location

Use template: `.cursor/templates/system-patterns.template.md`

## Output Location

Save to: `memory-bank/system-patterns.md`
