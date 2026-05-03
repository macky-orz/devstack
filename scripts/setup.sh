#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

cd "$ROOT_DIR"

echo "🔐 1. generate local certificates"
"$ROOT_DIR/scripts/generate-cert.sh"

echo "🐳 2. restart docker stack"
docker compose down
docker compose up -d --build

echo "✅ DONE"
echo "👉 https://dev.localhost"
