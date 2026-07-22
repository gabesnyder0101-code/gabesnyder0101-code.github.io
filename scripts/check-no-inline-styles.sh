#!/usr/bin/env bash
set -euo pipefail

matches=$(grep -rlE '<style' --include='*.html' . || true)

if [ -n "$matches" ]; then
  echo "Inline <style> tags found — move CSS into styles.css instead:"
  echo "$matches"
  exit 1
fi

echo "No inline <style> tags found."
