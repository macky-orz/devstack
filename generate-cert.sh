#!/bin/bash

set -e

DOMAIN="dev.localhost"
CERT_DIR="./nginx/certs"

echo "📁 Preparing cert directory..."
mkdir -p $CERT_DIR
chmod 755 $CERT_DIR

if [ -d "$CERT_DIR" ]; then
  sudo chown -R $USER:$USER $CERT_DIR 2>/dev/null || true
fi

echo "💥 Removing old certificates..."
rm -f $CERT_DIR/dev.localhost.pem
rm -f $CERT_DIR/dev.localhost-key.pem

echo "🧹 Cleaning mkcert CA (optional safe reset)..."
mkcert -uninstall || true

echo "🔧 Installing local CA..."
mkcert -install

echo "🚀 Generating wildcard certificate..."

mkcert \
  -key-file $CERT_DIR/dev.localhost-key.pem \
  -cert-file $CERT_DIR/dev.localhost.pem \
  "*.dev.localhost" \
  dev.localhost \
  localhost \
  127.0.0.1 \
  ::1

echo "✅ Done!"
echo "📌 Certificate location:"
echo "   $CERT_DIR/dev.localhost.pem"
echo "   $CERT_DIR/dev.localhost-key.pem"
