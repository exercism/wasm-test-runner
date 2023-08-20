#!/usr/bin/env bash

if [ -z "$EXERCISM_PRETTIER_VERSION" ]; then
  echo "Getting prettier version from pnpm"
  EXERCISM_PRETTIER_VERSION=$(pnpm list --long | grep ^prettier | cut -c 10-)
fi

if [ -z "$EXERCISM_PRETTIER_VERSION" ]; then
  echo "---------------------------------------------------"
  echo "This script requires the EXERCISM_PRETTIER_VERSION variable to work."
  echo "Please see https://exercism.org/docs/building/markdown/style-guide for guidance."
  echo "---------------------------------------------------"
  echo "This is what pnpm list reports:"
  echo "$(pnpm list prettier)"
  echo ""
  echo "This is the version that can be extracted:"
  echo "$(pnpm list --pattern prettier | grep -Po '.*\sprettier@\K.*')"
  echo ""
  echo "These files are found in the repo root:"
  echo "$(ls -p | grep -v /)"
  echo "---------------------------------------------------"
  exit 1
else
  echo "Running format with prettier@$EXERCISM_PRETTIER_VERSION"
fi

npx "prettier@$EXERCISM_PRETTIER_VERSION" --check "**/*.{js,jsx,ts,tsx,css,sass,scss,html,json,md,yml}"
