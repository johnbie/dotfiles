---
description: How to rebuild the NixOS system configuration
---

# Rebuilding NixOS

> [!CRITICAL]
> **HANDS OFF: The agent MUST NOT run any `nixos-rebuild` command.**
> This environment strictly enforces `no-new-privileges`. Even `nixos-rebuild build` or other non-sudo variants will fail or are unauthorized.

**NEVER attempt to execute:**
- `nixos-rebuild switch`
- `nixos-rebuild test`
- `nixos-rebuild build`
- `nixos-rebuild dry-activate`

Instead, you **MUST** provide the exact command to the user and ask them to run it manually.


### Required Procedure for Agents:
1.  **Modify** the Nix configuration files (e.g., `configuration.nix`).
2.  **Verify** syntax if possible (e.g. `nix-instantiate --parse`).
3.  **Stage** all changes using `git add .`.
4.  **COMMIT** the changes BEFORE informing the user. Use `run_command` to execute:
    ```bash
    git commit -m "feat(config): [summary of changes]"
    ```
5.  **Inform** the user that changes have been committed and provide the exact `nixos-rebuild` command for them to run.

**Commit Message Guidelines**:
- Include context on **what** changed and **why**.
- Example: `feat(config): enable NVIDIA drivers and CUDA for ComfyUI`
- Exception: For single program additions, `Add [program]` is fine.
