---
description: Automatically populate subheadings in a markdown file from a course, doc, or website link.
---

# Fill Markdown Subheadings

This workflow populates a markdown file with headings extracted from a course or documentation URL.

### Instructions for Agent:

1.  **Identify Context**:
    *   Determine the target markdown file (e.g., from the conversation or filename like `Frontend Masters - Practical Prompt Engineering.md`).
    *   Find the source URL in the conversation context.

2.  **Check for Existing Scraper**:
    *   Look in `~/dev/ai-dev/scraper/` for a directory matching the website domain.
        *   For example, a `frontendmasters.com` URL → check for `~/dev/ai-dev/scraper/frontendmasters/`.
    *   **If a scraper exists**: Run it with the URL as the argument. It outputs JSON to stdout.
        *   Example: `python ~/dev/ai-dev/scraper/frontendmasters/scrape_frontendmasters.py <URL>`
    *   **If no scraper exists**: Proceed to step 3.

3.  **Analyze Source & Build Scraper (only if no existing scraper)**:
    *   Use `browser_subagent` to visit the URL and study the page structure.
    *   Identify the DOM selectors for chapters/sections (level 2) and lessons/subsections (level 3).
    *   Create a new scraper in `~/dev/ai-dev/scraper/<site-name>/` following the pattern in existing scrapers:
        *   Main script that takes a URL argument and outputs JSON to stdout
        *   `shell.nix` for the Nix environment
        *   `requirements.txt` for Python dependencies
    *   The JSON output format must be: `[{ "chapter": "Chapter Name", "lessons": ["Lesson 1", "Lesson 2"] }]`
    *   Run the new scraper to get the data.

    **Site-Specific Selector Reference** (for building new scrapers):
    *   **Frontend Masters**: Open lesson sidebar via `.FMPlayer2-RibbonButton`, extract from `.lessons` panel. Requires login.

4.  **Map to Markdown Levels**:
    *   The file title (Header One `#`) is usually already present.
    *   **Chapters** (from JSON `chapter` field) → Header Two (`##`).
    *   **Lessons** (from JSON `lessons` array) → Header Three (`###`).
    *   **Additional Detail** (Level 4+) → **Bold text** (`**Text**`). Do not exceed level 3 headers.

5.  **Update File**:
    *   Insert the extracted headings into the target file.
    *   **CRITICAL**: Do NOT include any summaries, descriptions, or content. Only the headers.
    *   Maintain the sequence found on the website.

6.  **Verify**:
    *   Ensure the hierarchy is correctly applied.
    *   Check for duplicates or extraneous text (like "10m" durations or "Complete" labels) and remove them.
