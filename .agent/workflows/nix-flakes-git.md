---
description: Critical git requirements for Nix Flakes
---

# Nix Flakes & Git

> [!CRITICAL]
> **Files MUST be tracked by Git.**

When using Flakes, Nix will **only** see files that have been added to the git staging area.

If you create a new file (e.g., `hardware-configuration.nix` or a new module) and try to rebuild **without** adding it to git, the rebuild will fail with a "file not found" error, even if the file exists on the disk.

**Always run:**
```bash
git add .
```
or
```bash
git add <new-file>
```
**Before** providing the rebuild command to the user.

> [!CAUTION]
> **DANGER**: Do not run the rebuild yourself. Add the files to git, then ask the user to run the `nixos-rebuild` command manually.
