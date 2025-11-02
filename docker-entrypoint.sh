#!/bin/bash
set -e

echo "Starting Keycloak..."
/opt/keycloak/bin/kc.sh start-dev \
  --http-enabled=true \
  --hostname-strict=false \
  --proxy=edge \
  --import-realm
