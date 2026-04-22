---
description: How to create and manage AI-generated helper scripts and utilities
---

# AI Utility Scripts

All AI-generated helper scripts and utilities MUST be stored in `~/dev/ai-utils/`.

## Before Creating a Script

1. Check if a relevant script or project already exists:
```bash
ls ~/dev/ai-utils/
```
2. If a matching directory exists, review its contents before creating anything new:
```bash
ls ~/dev/ai-utils/<project-name>/
```
3. If a similar script exists, prefer modifying or extending it over creating a duplicate.

## Creating a New Script

4. Create a new subdirectory under `~/dev/ai-utils/` named after the tool's purpose (e.g. `extract_receipts`, `image_converter`).
5. Include at minimum:
   - The main script file
   - `shell.nix` — Nix environment with required dependencies
   - `requirements.txt` (if Python) or equivalent dependency file
6. Add a docstring or header comment to the main script explaining usage, prerequisites, and CLI options.
