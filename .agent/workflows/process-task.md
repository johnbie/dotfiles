---
description: Process and manage the task queue — triage, execute, and close tasks.
---

// turbo-all

# Task Workflow — Process

Use this workflow to process the task queue at `~/.agent/tasks/`.

Refer to `~/.agent/tasks/README.md` for the full schema (priorities, categories, front matter, naming).

> **Important:** To avoid IDE file-permission dialogs, use **only `run_command`** with shell commands for ALL file and directory operations throughout this workflow. Do NOT use `list_dir`, `view_file`, or `write_to_file` tools on the tasks directory. Use `ls` to list, `cat` to read, `mv`/`cp` to move, and `sed` to edit.

---

## Steps

### 1. Pick the Next Task

- Ensure the task folders exist. If any are missing, create them:
  ```bash
  mkdir -p ~/.agent/tasks/{inbox,today,active,done,failed,removed}
  ```
- List tasks by priority:
  ```bash
  ls ~/.agent/tasks/today/
  ```
- If `today/` is empty, check `inbox/`:
  ```bash
  ls ~/.agent/tasks/inbox/
  ```
- Pick the file with the **lowest P-number** (highest priority). Break ties by creation date (oldest first).
- If both are empty, inform the user there are no pending tasks.

### 2. Triage

- Read the task file using `cat` and present a summary to the user: title, priority, category, assignment, and a brief of the reason/requirements.
  ```bash
  cat ~/.agent/tasks/today/P1-task.md
  ```
- Ask the user to decide:
  - **Start** — proceed to step 3.
  - **Remove** — close the task as removed (step 5).
  - **Skip** — leave the task where it is and move to the next one.
  - **Reprioritize** — rename the file to change the P-level:
    ```bash
    mv ~/.agent/tasks/today/P3-task.md ~/.agent/tasks/today/P1-task.md
    ```

### 3. Start

```bash
mv ~/.agent/tasks/today/P1-task.md ~/.agent/tasks/active/
```

- Check the `assigned` field in front matter.

### 4. Execute

- **If `assigned: AI`**: perform the task autonomously following the instructions in "How to Perform". Report progress and results to the user.
- **If `assigned: Human`**: assist the user as they direct. Follow their instructions and provide help when asked.

> **Splitting rule:** If the task reaches a point where it needs to "wait" (client response, pending decision, etc.), do the following:
> 1. Create a new task in `inbox/` for the remaining work using the `/create-task` workflow, linking it via `previous_task`.
> 2. Update the current task's `next_task` to point to the new file:
>    ```bash
>    sed -i "s/^next_task:.*/next_task: P2-follow-up.md/" ~/.agent/tasks/active/P1-current.md
>    ```
> 3. Close the current task as **done** (step 5).
>
> Automated waits (compilation, builds) do **not** count — just wait for them.

> **Linked task lookup:** `previous_task` and `next_task` store the **base filename** (without the date prefix, e.g. `P1-process-receipts.md`). Since finished tasks get a date prepended, use glob to locate them:
> ```bash
> find ~/.agent/tasks/ -name "*P1-process-receipts.md"
> ```

### 5. Close

When work is finished, failed, or removed:

```bash
FILE=~/.agent/tasks/active/P1-task.md
TIMESTAMP=$(date +%Y-%m-%d-%H%M%S)
BASENAME=$(basename "$FILE")

# 1. Set finished datetime in front matter
sed -i "s/^finished:.*/finished: $(date -Iseconds)/" "$FILE"

# 2. Move to appropriate folder with datetime prefix
# Use done/, failed/, or removed/ as appropriate
mv "$FILE" ~/.agent/tasks/done/${TIMESTAMP}-${BASENAME}
```

Return to step 1 to process the next task, or stop if the user says so.

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