#!/bin/bash

set -e

cd "$(dirname "$0")"

echo "🔧 1. mkcert root CA (first time only)"
mkcert -install || true

echo "🔐 2. generate wildcard certificate"
./generate-cert.sh

echo "🐳 3. restart docker stack"
docker compose down
docker compose up -d --build

echo "✅ DONE"
echo "👉 https://dev.localhost"
