---
description: Automatically populate subheadings in a markdown file from a course, doc, or website link.
---

# Fill Markdown Subheadings

This workflow allows you to infer the structure of a course or documentation from a URL and populate a markdown file with the corresponding headings.

### Instructions for Agent:

1.  **Identify Context**:
    *   Determine the target markdown file (e.g., from the conversation or filename like `Frontend Masters - Practical Prompt Engineering.md`).
    *   Find the source URL in the conversation context.

2.  **Analyze Source Structure**:
    *   Use the `read_url_content` or `browser_subagent` to visit the link.
    *   Extract the primary groupings (Chapters/Modules) and secondary groupings (Lessons/Sections).
    *   **Specific for Frontend Masters**:
        *   Main Title: `h1`
        *   Chapters: `h3.FM-Heading-3` inside `.Course-TOC`
        *   Lessons: `h3.title` inside `.Course-Lesson-List-Item`

3.  **Map to Markdown Levels**:
    *   The file title (Header One `#`) is usually already present or should be based on the page's main title.
    *   **Chapters** (Level 2 groupings) → Header Two (`##`).
    *   **Lessons/Subchapters** (Level 3 groupings) → Header Three (`###`).
    *   **Additional Detail** (Level 4+ groupings) → **Bold text** (`**Text**`). Do not exceed level 3 headers.

4.  **Update File**:
    *   Insert the extracted headings into the target file.
    *   **CRITICAL**: Do NOT include any summaries, descriptions, or content. Only the headers.
    *   Maintain the sequence found on the website.

5.  **Verify**:
    *   Ensure the hierarchy is correctly applied.
    *   Check for duplicates or extraneous text (like "10m" durations or "Complete" labels) and remove them.
