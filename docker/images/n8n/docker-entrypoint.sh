#!/bin/sh
if [ -d /opt/custom-certificates ]; then
  echo "Trusting custom certificates from /opt/custom-certificates."
  export NODE_OPTIONS=--use-openssl-ca $NODE_OPTIONS
  export SSL_CERT_DIR=/opt/custom-certificates
  c_rehash /opt/custom-certificates
fi

sed -i -e 's/this.manager?.hasFeatureEnabled(feature) ?? false/feature !== null/g' -e 's/LICENSE_QUOTAS.TEAM_PROJECT_LIMIT) ?? 0/LICENSE_QUOTAS.TEAM_PROJECT_LIMIT) ?? 100/g' /usr/local/lib/node_modules/n8n/dist/license.js

if [ "$#" -gt 0 ]; then
  # Got started with arguments
  exec n8n "$@"
else
  # Got started without arguments
  exec n8n
fi
