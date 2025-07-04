#!/bin/sh

sed -i \
		-e 's/this.manager?.hasFeatureEnabled(feature) ?? false/!["feat:showNonProdBanner","feat:aiAssistant","feat:askAi","feat:aiCredits","feat:apiDisabled"].includes(feature)/g' \
		-e 's/LICENSE_QUOTAS.TEAM_PROJECT_LIMIT) ?? 0/LICENSE_QUOTAS.TEAM_PROJECT_LIMIT) ?? 1000/g' \
		/usr/local/lib/node_modules/n8n/dist/license.js

sed -i \
    -e 's/this.licenseProvider.isLicensed(feature)/!["feat:showNonProdBanner","feat:aiAssistant","feat:askAi","feat:aiCredits","feat:apiDisabled"].includes(feature)/g' \
		-e 's/this.getValue(\'quota:maxTeamProjects\') ?? 0/1000/g' \
		/usr/local/lib/node_modules/n8n/node_modules/@n8n/backend-common/dist/license-state.js
