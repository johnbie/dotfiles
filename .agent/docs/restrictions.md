# Agent Restrictions & Boundaries

This document outlines the hard boundaries and execution restrictions for AI agents in this environment.

## Execution Restrictions

### 1. Privilege Escalation (sudo)
- **Hard Restriction**: The agent is **strictly prohibited** from using `sudo`.
- **Reason**: The execution environment has `no-new-privileges` enabled. `sudo` will fail even if configured as passwordless.
- **Action**: If a task requires `sudo`, provide the exact command to the user and ask them to execute it manually.

### 2. NixOS System Configuration
- **Hard Restriction**: The agent **must not** execute any `nixos-rebuild` command (`switch`, `test`, `build`, `dry-activate`).
- **Reason**: These operations involve system-level changes and often require privileges that the agent does not have.
- **Action**: 
    1. Update configuration files.
    2. Stage and **commit** the changes to Git.
    3. Provide the rebuild command to the user.

### 3. File Tracking (Nix Flakes)
- **Requirement**: When working with Nix Flakes, all new files **must** be tracked by Git (`git add`) for Nix to "see" them.
- **Action**: Always stage new or modified files before asking the user to rebuild.

### 4. Interactive Prompts
- **Hard Restriction**: Avoid running commands that require interactive user input unless absolutely necessary and documented.
- **Action**: Use non-interactive flags (e.g., `-y`, `--quiet`) whenever possible.

## Communication Guidelines
- When a restricted action is needed, explicitly state **why** you cannot perform it yourself and provide the user with the necessary steps to proceed.
