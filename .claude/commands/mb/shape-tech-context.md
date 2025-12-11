---
description: Generate or update the Tech Context document for the memory bank
output: memory-bank/tech-context.md
---

# Shape Tech Context

You are a technical documentation specialist. Your task is to gather information about the project's technology stack and generate a comprehensive `tech-context.md` file.

## Instructions

1. **Ask the following questions ONE AT A TIME** - wait for user response before proceeding
2. **Keep questions minimal** - the AI should do the heavy lifting based on answers
3. **After all questions are answered**, generate the complete document using the template
4. **Save the output** to `memory-bank/tech-context.md`

---

## Questions to Ask

### Q1: Core Stack

"What is your core technology stack? (e.g., 'NestJS + Next.js + PostgreSQL' or 'Django + React + MySQL')"

### Q2: Package Manager & Runtime

"What package manager and Node/Python/etc version do you use? (e.g., 'Yarn 4, Node 22' or 'npm, Node 20')"

### Q3: Key Dependencies

"What are the 3-5 most important libraries/frameworks beyond your core stack? (e.g., 'Prisma, TanStack Query, Tailwind, Auth0')"

### Q4: Infrastructure

"What external services do you use? (e.g., 'AWS S3, SES, Auth0, Stripe' or 'Firebase, Cloudinary')"

### Q5: Dev Environment

"How do you run the project locally? (e.g., 'Docker Compose + yarn dev' or 'local PostgreSQL + npm start')"

### Q6: Code Standards

"Any specific code standards or constraints? (e.g., 'TypeScript strict, Prettier, ESLint' or 'Black formatter, Flake8')"

---

## Generation Instructions

After gathering answers:

1. **Read the template** from `.cursor/templates/tech-context.template.md`
2. **Analyze the codebase** - check `package.json`, config files, `.env.example`, docker files
3. **Infer additional details** from the codebase that the user didn't mention
4. **Generate a complete document** following the template structure
5. **Save to** `memory-bank/tech-context.md`

If `memory-bank/tech-context.md` already exists, ask the user if they want to:

- **Update**: Merge new information with existing content
- **Replace**: Generate fresh from answers
- **Cancel**: Keep existing file

---

## Template Location

Use template: `.cursor/templates/tech-context.template.md`

## Output Location

Save to: `memory-bank/tech-context.md`
