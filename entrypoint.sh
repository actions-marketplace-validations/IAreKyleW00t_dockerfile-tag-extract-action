#!/bin/bash
# Default to STDOUT for local testing
GITHUB_OUTPUT=${GITHUB_OUTPUT:-/dev/stdout}

FILENAME=${1:-"Dockerfile"}
if [ ! -f "$FILENAME" ]; then
    echo "ERROR: Could not open $FILENAME"
    exit 1
fi

# Generate random EOF
# https://docs.github.com/en/actions/security-guides/security-hardening-for-github-actions#understanding-the-risk-of-script-injections
EOF="EOF_$(dd if=/dev/urandom bs=15 count=1 status=none | base64)"

echo "versions<<$EOF" >> $GITHUB_OUTPUT
grep -Eo '^FROM \w[0-9A-Za-z-]+:[0-9A-Za-z\.-]+' "$FILENAME" | cut -d ':' -f2 >> $GITHUB_OUTPUT
echo "$EOF" >> $GITHUB_OUTPUT
