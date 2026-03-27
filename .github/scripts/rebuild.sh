#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for ethersphere/bee-docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
export NVM_DIR="${HOME}/.nvm"
if [ ! -f "${NVM_DIR}/nvm.sh" ]; then
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
fi
source "${NVM_DIR}/nvm.sh"

nvm install 22
nvm use 22

node --version
npm --version

# --- Dependencies ---
# Skip scripts to avoid prebuild network requests during install
npm install --ignore-scripts

# --- Build ---
# prebuild hook fetches docs/references/awesome-list.mdx from GitHub (network required)
npm run build

echo "[DONE] Build complete."
