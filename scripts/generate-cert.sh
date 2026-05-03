#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CERT_DIR="$ROOT_DIR/docker/nginx/certs"

mkdir -p "$CERT_DIR"

if ! command -v mkcert >/dev/null 2>&1; then
  echo "mkcert is not installed."
  exit 1
fi

mkcert -install

mkcert \
  -cert-file "$CERT_DIR/dev.localhost.pem" \
  -key-file "$CERT_DIR/dev.localhost-key.pem" \
  "dev.localhost" \
  "*.dev.localhost" \
  "*.wp.localhost" \
  "adminer.dev.localhost" \
  "mailhog.dev.localhost"

echo "Certificates generated in:"
echo "  $CERT_DIR"
