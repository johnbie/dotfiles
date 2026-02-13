---
description: Create a new task in the task queue.
---

// turbo-all

# Task Workflow — Create

Use this workflow to create a new task in the queue at `~/.agent/tasks/`.

Refer to `~/.agent/tasks/README.md` for the full schema (priorities, categories, front matter, naming).

---

## Steps

### 1. Copy the Template

- Copy `~/.agent/template/task-template.md` to a new file.
- If the template or task folders are missing, create them.

### 2. Set the Filename

- Use the format `P{0-5}-descriptive-name.md` based on priority.
- Example: `P1-process-receipts.md`

### 3. Fill in Front Matter

- `created`: current datetime (ISO 8601)
- `category`: one of `Infrastructure`, `Business`, `Websites`, `Chores`, `Learning`, `Self-Improvement`, `Misc`
- `assigned`: `AI` or `Human`
- `due`: if applicable
- `previous_task`, `next_task`: base filename of linked tasks, if applicable

### 4. Fill in Sections

- **Reason** — why this task is needed, with context and motivation.
- **Requirements** — checklist of requirements or blockers.
- **How to Perform** — step-by-step instructions.
- **Reference** *(optional)* — relevant links, files, or resources.

### 5. Place the File

- Default: `~/.agent/tasks/inbox/`
- If it should be done today: `~/.agent/tasks/today/`