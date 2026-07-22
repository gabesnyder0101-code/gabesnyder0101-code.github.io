---
description: Add a new project card to projects.html from a description, PDF, or image, then commit and push
---

Add a new project to the portfolio site (`projects.html`). The user's input for this project follows below (a description, and/or a path to a PDF or image): $ARGUMENTS

Follow this workflow:

1. **Gather the source material.** If a PDF was given, extract its text (and any embedded photos if a real photo of the finished project would help the card — see step 3). If only a description was given, work from that directly.

2. **Ask only if truly missing.** If the month/year of the project isn't stated or inferable, ask the user for it — don't guess. Everything else, write from what's given.

3. **Write the card content:**
   - Title: short, specific, no people's names in it.
   - Description: **first person, 2-4 sentences**, no names of teammates, mentors, or anyone else — describe your own role and what you did/learned/built. It's fine to say "as part of a team" without naming who.
   - Tags: 2-3 short tags (e.g. "Engineering", "CAD", "Web Dev").
   - Photo (optional): if a PDF was provided, check for embedded images that show the actual finished project. Extract candidates with pypdf/Pillow, view them, and pick one that does NOT show anyone's face, name, or other identifying text (crop or skip if every option does). Optimize it (`Pillow`, `quality=85, optimize=True`) and save into `assets/`. Reference it with `<img class="card-img" src="assets/<name>.jpg" alt="...">` as the first element inside the card `<div>`.

4. **Insert the card into `projects.html`.** If a placeholder card (with "Project Title Goes Here" / "Another Project Title" filler text) still exists, replace one of those. Otherwise add a new `<div class="card">...</div>` just before the closing `</div>` of `.project-grid`. Match the existing card markup structure exactly (see the HTML comment above the cards for the pattern).

5. **Verify before committing:**
   - Run `bash scripts/check-no-inline-styles.sh` — must pass.
   - Open the file in the browser preview and visually confirm the card renders correctly (image cropped properly, text not overflowing).

6. **Commit and push** with a descriptive message (e.g. `Add <project name> project`), directly to `main` (this repo has no PR workflow — GitHub Pages deploys straight from `main`).

7. **Confirm the live deploy.** Poll `gh run list --workflow=pages-build-deployment --limit 1` until the run for your commit SHA completes, then `curl` the live page (with a cache-busting query param) to confirm the new content is actually served — don't rely on a browser tab's cached view.

Ask for confirmation before pushing only if something about the card content is ambiguous (e.g. you're unsure whether a photo is privacy-safe) — otherwise this is a low-risk, easily-revertable content change and you can proceed through commit/push without pausing.
