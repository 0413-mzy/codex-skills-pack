#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "更新 codex-skills-pack..."
bash "$SCRIPT_DIR/install.sh"

