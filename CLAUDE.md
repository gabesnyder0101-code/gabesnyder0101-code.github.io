# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Static GitHub Pages site for Darien Silversteen's resume and project portfolio, served at https://gabesnyder0101-code.github.io (the repo name is a GitHub Pages "user site," so pushing to `main` deploys automatically — no build step, no CI).

## Structure

- `index.html` — resume: education, relevant experience, school projects, extracurriculars, skills, awards. Contact info is intentionally email-only; the phone number from the source resume is left off for privacy.
- `projects.html` — portfolio page, linked from the shared nav bar. Placeholder project cards are still in place; each has an HTML comment above the grid explaining how to copy/edit a card for a real project.

Both pages share the same inline `<style>` block (no external CSS/JS dependencies, no framework). Keep the two pages' nav bar and styling in sync if you change one.

## Working on this repo

- There's no build/lint/test tooling — edit the HTML directly and verify by opening the file in a browser.
- Deploys are automatic on push to `main`; there's no staging environment.
