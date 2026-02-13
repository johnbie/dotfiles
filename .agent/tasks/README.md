# Task Queue

This directory manages tasks for the user and AI agents.

## Structure

- **inbox/**: New tasks go here. They are untriaged and need to be reviewed.
- **active/**: Tasks currently being worked on.
- **done/**: Completed tasks. Move tasks here when finished.
- **context/**: Shared context files, notes, or resources relevant to multiple tasks.

## Task File Format

Task files should use Markdown (`.md`).
The filename should be descriptive, e.g., `setup-nix-config.md`.

**Example Content:**

```markdown
# Task Title

## Objective
Description of what needs to be done.

## Status
- [ ] Todo item 1
- [ ] Todo item 2
```
