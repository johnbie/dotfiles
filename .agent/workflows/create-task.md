---
description: Create a new task in the task queue.
---

// turbo-all

# Task Workflow — Create

Use this workflow to create a new task in the queue at `~/.agent/tasks/`.

Refer to `~/.agent/tasks/README.md` for the full schema (priorities, categories, front matter, naming).

> **Important:** To avoid IDE file-permission dialogs, use **only `run_command`** with shell commands for ALL file and directory operations throughout this workflow. Do NOT use `list_dir`, `view_file`, or `write_to_file` tools on the tasks directory. Use `ls` to list, `cat` to read, `cp` to copy, and `sed` to edit.

---

## Steps

### 1. Copy the Template

```bash
# Create target folder if missing
mkdir -p ~/.agent/tasks/inbox ~/.agent/tasks/today

# Copy template to target location (set DEST to inbox/ or today/)
cp ~/.agent/template/task-template.md ~/.agent/tasks/inbox/P1-descriptive-name.md
```

### 2. Set the Filename

- Use the format `P{0-5}-descriptive-name.md` based on priority.
- Example: `P1-process-receipts.md`

### 3. Fill in Front Matter

Use `sed` to populate front matter fields in-place:

```bash
FILE=~/.agent/tasks/inbox/P1-descriptive-name.md

sed -i "s/^created:.*/created: $(date -Iseconds)/" "$FILE"
sed -i "s/^category:.*/category: Infrastructure/" "$FILE"
sed -i "s/^assigned:.*/assigned: AI/" "$FILE"
# Optional fields:
sed -i "s/^due:.*/due: 2026-02-20/" "$FILE"
sed -i "s/^previous_task:.*/previous_task: P2-some-other-task.md/" "$FILE"
sed -i "s/^next_task:.*/next_task: P3-follow-up.md/" "$FILE"
```

### 4. Fill in Sections

Use a heredoc with `cat` to replace the body content below the front matter:

```bash
FILE=~/.agent/tasks/inbox/P1-descriptive-name.md

# Extract front matter (lines 1 through closing ---), then append body
FRONT_MATTER=$(sed -n '1,/^---$/{ /^---$/!p; /^---$/{ x; /---/{ x; p; q }; x; s/.*//; h; p } }' "$FILE")

cat > "$FILE" << 'TASKEOF'
---
created: 2026-02-13T13:00:00-08:00
due:
finished:
category: Infrastructure
assigned: AI
previous_task:
next_task:
---

# Task Title

## Reason

Why this task is needed.

## Requirements

- [ ] Requirement 1
- [ ] Requirement 2

## How to Perform

Step-by-step instructions.

## Reference

- Relevant links and files.
TASKEOF
```

> The above is an example — replace the content with actual values. The key point is to use `cat > file << 'EOF'` to write file content via shell commands.

### 5. Place the File

- Default: `~/.agent/tasks/inbox/`
- If it should be done today: `mv ~/.agent/tasks/inbox/FILE ~/.agent/tasks/today/`