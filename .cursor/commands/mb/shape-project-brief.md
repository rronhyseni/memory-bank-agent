---
description: Generate or update the project-brief.md file for the memory-bank
output: memory-bank/project-brief.md
---

# Shape Project Brief

You are helping the user create a comprehensive `project-brief.md` file. Your job is to ask minimal questions, then do the heavy lifting to generate a complete document.

## Process

### Step 1: Quick Discovery (Ask These Questions)

**CRITICAL: You MUST ask questions and STOP. DO NOT proceed with generation until the user has answered ALL questions.**

Ask the user these questions in a conversational way. Group them naturally, don't dump all at once. **After asking each question or group of questions, you MUST STOP and WAIT for the user's response before proceeding.**

**Round 1 - The Basics:**

1. What's the project name and what does it do in 1-2 sentences?
2. Who uses it? (e.g., end-users, businesses, admins, etc.)

**Round 2 - Technical Foundation:** 3. What's your tech stack? (backend, frontend, database, etc.) 4. Is this a monorepo, microservices, monolith, or other architecture?

**Round 3 - Scope & Status:** 5. What are the 3-5 main features or capabilities? 6. What's the current project stage? (planning/early dev/active dev/production)

**That's it.** Stop asking questions after these 6 essentials.

**IMPORTANT: After asking all questions, you MUST STOP and WAIT for the user to provide ALL answers before proceeding to Step 2. DO NOT begin analysis or generation until the user has responded to all questions.**

### Step 2: Analyze & Infer

Before generating, scan the codebase if accessible to discover:

- Repository structure (look at top-level folders)
- Package.json or similar for dependencies and constraints
- Existing documentation or README
- Database schemas or API routes for functional requirements

Use this to fill gaps and enrich the document beyond what the user explicitly said.

### Step 3: Generate the Document

Use the template structure from `.cursor/templates/project-brief.template.md` in the `.cursor` folder at project root, and generate a comprehensive `project-brief.md` in `memory-bank/` at the project root.

#### Required Sections (always include):

```markdown
# Project Brief

## Project Identity

- Name, Type, Architecture, Codebase identifier

## Core Purpose

- 2-3 paragraphs explaining what, who, why, and how

## Primary Goals

- 4-6 goals derived from the features and user types mentioned
- Format: **Goal Title** - Description of success

## Key Requirements

### Functional Requirements

- Infer from features mentioned + codebase analysis
- Be specific with details

### Non-Functional Requirements

- Include: Scalability, Performance, Security, Reliability as baseline
- Add others based on project type

## Technology Foundation

- Organize by category (Backend, Frontend, Database, Infrastructure, etc.)

## Project Scope

### In Scope

- Expand the features into comprehensive list

### Out of Scope

- Infer reasonable boundaries based on project type
- Mark with <!-- Verify --> if uncertain

### Recently Removed

- Default to: _No features have been recently removed._

## Success Criteria

- One criterion per user type mentioned
- Format: **[User type]** can [achieve outcome]

## Project Status

- Stage, Active Work, Recent Changes, Next Phase

## Constraints

- Technical: versions, tools, required platforms
- Business: any limits, quotas, workflows mentioned or inferred

## Repository Structure

- Show actual structure if scanned, or ask user to verify

## Related Documentation

- Link to other memory-bank files (even if not yet created)
```
