---
description: How to rebuild the NixOS system configuration
---

# Rebuilding NixOS

> [!IMPORTANT]
> The AI agent **cannot** run `nixos-rebuild switch` directly.
> The environment has `no-new-privileges` set, which prevents `sudo` from working even if configured with `NOPASSWD`.

**Do not attempt to run `sudo nixos-rebuild switch` yourself.**

Instead, you must instruct the user to run the command manually:

1.  Ensure all changes are committed to git.
2.  Ask the user to run:
    ```bash
    sudo nixos-rebuild switch --flake .#nixos
    ```
