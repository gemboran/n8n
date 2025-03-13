#!/bin/sh

sed -i \
		-e 's/this.manager?.hasFeatureEnabled(feature) ?? false/!["feat:showNonProdBanner","feat:aiAssistant","feat:askAi","feat:aiCredits","feat:apiDisabled"].includes(feature)/g' \
		-e 's/LICENSE_QUOTAS.TEAM_PROJECT_LIMIT) ?? 0/LICENSE_QUOTAS.TEAM_PROJECT_LIMIT) ?? 1000/g' \
		/usr/local/lib/node_modules/n8n/dist/license.js

apk add --update python3 py3-pip

pip install jobspy
