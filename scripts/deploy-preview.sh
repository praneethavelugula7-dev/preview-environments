#!/bin/bash
set -euo pipefail

PR_NUMBER="${1:-}"

if [[ ! "$PR_NUMBER" =~ ^[0-9]+$ ]]; then
    echo "Usage: ./scripts/deploy-preview.sh <PR-number>"
    exit 1
fi

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
NAMESPACE="preview-pr-${PR_NUMBER}"
OVERLAY_DIR="$PROJECT_ROOT/k8s/overlays/pr-${PR_NUMBER}"

mkdir -p "$OVERLAY_DIR"

cat > "$OVERLAY_DIR/kustomization.yaml" <<EOF
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: ${NAMESPACE}

resources:
  - ../../base
EOF

echo "Creating namespace: $NAMESPACE"
kubectl create namespace "$NAMESPACE" --dry-run=client -o yaml | kubectl apply -f -

echo "Deploying preview for PR #$PR_NUMBER"
kubectl apply -k "$OVERLAY_DIR"

echo "Preview environment deployed in namespace: $NAMESPACE"