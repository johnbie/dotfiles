# Task Queue

This directory manages a task queue for both the human and AI agent.

## Folder Structure

| Folder | Purpose |
|---|---|
| `inbox/` | New, untriaged tasks |
| `today/` | Tasks selected to work on today |
| `active/` | Task currently being worked on (only one at a time ideally) |
| `done/` | Successfully completed tasks |
| `failed/` | Tasks that were attempted but could not be completed |
| `removed/` | Tasks that were discarded without being done |

## File Naming

- **Active tasks:** `P{0-5}-descriptive-name.md` (e.g. `P1-process-receipts.md`)
- **Finished/failed/removed:** prepend datetime — `YYYY-MM-DD-HHMMSS-P{0-5}-descriptive-name.md` (e.g. `2026-01-15-143000-P1-process-receipts.md`)

## Priority Levels

| Level | Meaning |
|---|---|
| P0 | Immediate — everything else on hold |
| P1 | High importance — ideally finish today |
| P2 | High urgency, not actually important |
| P3 | Nice to do within a week |
| P4 | Nice to do within a month |
| P5 | Nice to do within a year |

## Categories

| Category | Scope |
|---|---|
| Infrastructure | Tooling, environment, this OS |
| Business | Tasks for the user's business(es) |
| Websites | External client website work |
| Chores | Household, taxes, etc. |
| Learning | Courses, books, study material |
| Self-Improvement | Personal systems and habits |
| Misc | Uncategorized — should be re-categorized later |

## YAML Front Matter

Every task file must include the following metadata:

```yaml
---
created: 2026-02-13T13:00:00       # required — ISO 8601 datetime
due: 2026-02-20                     # optional — ISO 8601 date
finished:                           # set on done/failed/removed — ISO 8601 datetime
category: Infrastructure            # required — see Categories above
assigned: AI                        # required — AI or Human
previous_task:                      # optional — base filename of predecessor (without date prefix)
next_task:                          # optional — base filename of successor (without date prefix)
---
```

## Required Sections

| Section | Purpose |
|---|---|
| `## Reason` | Why this task is needed |
| `## Requirements` | Checklist of requirements or blockers |
| `## How to Perform` | Step-by-step instructions |
| `## Reference` | *(optional)* Relevant links and files |

## Task Lifecycle

```
inbox/ ──▶ today/ ──▶ active/ ──▶ done/
                        │          failed/
                        │          removed/
                        ▼
                  (If task needs waiting,
                   split remaining work
                   into a new task in inbox/)
```

> **Splitting rule:** If a task reaches a point where it needs to "wait" (e.g. client response, pending decision), split the remaining work into a new task and close the current one as done. Automated waits like compilation/builds do **not** count.

See the `/tasks` workflow for the full processing flow.
