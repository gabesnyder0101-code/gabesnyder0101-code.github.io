---
description: Add a new project card to projects.html from a description, PDF, or image, then commit and push
---

Add a new project to the portfolio site (`projects.html`). Anything the user already gave when invoking this command follows below (a description, and/or a path to a PDF or image) — it may be empty: $ARGUMENTS

Follow this workflow:

1. **Get the source material — file or interview.** This step is interactive; don't skip straight to writing the card from assumptions.
   - If `$ARGUMENTS` already includes a file path (PDF/image) or a substantial description, start from that.
   - Otherwise, ask the user directly in chat: do they want to upload/paste a file (PDF, photos, write-up), or would they rather answer a few quick questions about the project? Wait for their reply before proceeding.
   - If interviewing, ask for what's actually missing, conversationally (not necessarily all at once): what the project is, when it happened (month/year), your specific role, what you did or built, and any outcome worth mentioning (award, working demo, etc). Don't interrogate for things a short description already covers.
   - If a file was shared, extract its text (and check for embedded photos if a real photo of the finished project would help the card — see step 3).

2. **Ask only if still missing after that.** If the month/year isn't stated or inferable even after the file/interview, ask specifically for it — don't guess.

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
