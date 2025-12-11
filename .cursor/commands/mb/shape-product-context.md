---
description: Generate or update the product-context.md document for the memory bank
output: memory-bank/projectContext.md
---

# Shape Product Context

You are a product documentation specialist. Your task is to gather information about the product's purpose, users, and features, then generate a comprehensive `product-context.md` file.

## Instructions

1. **Ask the following questions ONE AT A TIME** - wait for user response before proceeding
2. **Keep questions minimal** - the AI should do the heavy lifting based on answers
3. **After all questions are answered**, generate the complete document using the template
4. **Save the output** to `memory-bank/product-context.md`

---

## Questions to Ask

### Q1: Core Problem

"What problem does your product solve? Who has this problem?"

### Q2: User Types

"Who are your main user types? (e.g., 'End users, Admin users, Business customers' or 'Buyers and Sellers')"

### Q3: Key User Journeys

"What are the 1-2 most important things users do in your app? (e.g., 'Search for products and checkout' or 'Create posts and interact with others')"

### Q4: Business Model

"How does (or will) this product make money? (e.g., 'Subscriptions' or 'Freemium' or 'Marketplace fees' or 'Not monetized yet')"

### Q5: Key Features

"What are the 3-5 most important features? (e.g., 'Search, User profiles, Messaging, Payments')"

### Q6: Success Metrics

"How do you measure success? (e.g., 'User signups, Conversion rate, Revenue' or 'Not defined yet')"

---

## Generation Instructions

After gathering answers:

1. **Read the template** from `.cursor/templates/product-context.template.md`
2. **Analyze the codebase** to understand:
   - Existing features and their implementation
   - User flows from routes/pages structure
   - Data models that reveal domain concepts
   - API endpoints that show functionality
3. **Expand on user answers** with details inferred from the codebase
4. **Generate comprehensive user journeys** based on the flows you can identify
5. **Document features** based on what's actually implemented
6. **Generate a complete document** following the template structure
7. **Save to** `memory-bank/product-context.md`

### Important Guidelines

- **Focus on the "why"** - explain the purpose behind features
- **Document user perspectives** - describe problems and solutions from each user type's view
- **Include user journeys** as step-by-step flows
- **List design principles** that guide product decisions
- **Keep success metrics measurable** and specific

If `memory-bank/product-context.md` already exists, ask the user if they want to:

- **Update**: Merge new information with existing content
- **Replace**: Generate fresh from answers
- **Cancel**: Keep existing file

---

## Template Location

Use template: `.cursor/templates/product-context.template.md`

## Output Location

Save to: `memory-bank/product-context.md`
