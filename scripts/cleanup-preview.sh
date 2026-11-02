#!/bin/bash
set -euo pipefail

PR_NUMBER="${1:-}"

if [[ ! "$PR_NUMBER" =~ ^[0-9]+$ ]]; then
    echo "Usage: ./scripts/cleanup-preview.sh <PR-number>"
    exit 1
fi

NAMESPACE="preview-pr-${PR_NUMBER}"

echo "Cleaning up preview environment for PR #${PR_NUMBER}"

kubectl delete namespace "$NAMESPACE" --ignore-not-found

echo "Preview environment for PR #${PR_NUMBER} has been cleaned up."