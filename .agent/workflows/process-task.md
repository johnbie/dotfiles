---
description: Process and manage the task queue — triage, execute, and close tasks.
---

// turbo-all

# Task Workflow — Process

Use this workflow to process the task queue at `~/.agent/tasks/`.

Refer to `~/.agent/tasks/README.md` for the full schema (priorities, categories, front matter, naming).

---

## Steps

### 1. Pick the Next Task

- Ensure the task folders exist (`inbox/`, `today/`, `active/`, `done/`, `failed/`, `removed/`). If any are missing, create them under `~/.agent/tasks/`.
- Look in `~/.agent/tasks/today/` first. Pick the file with the **lowest P-number** (highest priority). Break ties by creation date (oldest first).
- If `today/` is empty, look in `~/.agent/tasks/inbox/` using the same rules.
- If both are empty, inform the user there are no pending tasks.

### 2. Triage

- Read the task file and present a summary to the user: title, priority, category, assignment, and a brief of the reason/requirements.
- Ask the user to decide:
  - **Start** — proceed to step 3.
  - **Remove** — move the file to `removed/`, set `finished` in front matter to the current datetime, and prepend the datetime to the filename (format: `YYYY-MM-DD-HHMMSS-`). Then return to step 1.
  - **Skip** — leave the task where it is and move to the next one.
  - **Reprioritize** — update the P-level in the filename and optionally move between `inbox/` and `today/`.

### 3. Start

- Move the task file to `~/.agent/tasks/active/`.
- Check the `assigned` field in front matter.

### 4. Execute

- **If `assigned: AI`**: perform the task autonomously following the instructions in "How to Perform". Report progress and results to the user.
- **If `assigned: Human`**: assist the user as they direct. Follow their instructions and provide help when asked.

> **Splitting rule:** If the task reaches a point where it needs to "wait" (client response, pending decision, etc.), do the following:
> 1. Create a new task in `inbox/` for the remaining work, linking it via `previous_task`.
> 2. Update the current task's `next_task` to point to the new file.
> 3. Close the current task as **done** (step 5).
>
> Automated waits (compilation, builds) do **not** count — just wait for them.

> **Linked task lookup:** `previous_task` and `next_task` store the **base filename** (without the date prefix, e.g. `P1-process-receipts.md`). Since finished tasks get a date prepended, use `grep -rl "P1-process-receipts" ~/.agent/tasks/` or search by glob (`*P1-process-receipts.md`) to locate them across folders.

### 5. Close

When work is finished (or has failed):

1. Set the `finished` field in front matter to the current datetime (ISO 8601, e.g. `2026-02-13T14:30:00`).
2. Prepend the datetime to the filename: `YYYY-MM-DD-HHMMSS-original-filename.md`.
   - Example: `P1-process-receipts.md` → `2026-02-13-143000-P1-process-receipts.md`
3. Move the file to the appropriate folder:
   - **`done/`** — task completed successfully.
   - **`failed/`** — task was attempted but could not be completed.
4. Return to step 1 to process the next task, or stop if the user says so.

---

## Quick Reference

| Action | Command |
|---|---|
| List today's tasks | `ls ~/.agent/tasks/today/` |
| List inbox | `ls ~/.agent/tasks/inbox/` |
| List active | `ls ~/.agent/tasks/active/` |
| See all done | `ls ~/.agent/tasks/done/` |
| See all failed | `ls ~/.agent/tasks/failed/` |
| See all removed | `ls ~/.agent/tasks/removed/` |