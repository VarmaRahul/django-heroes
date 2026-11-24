#!/usr/bin/env sh
set -eu

IMAGE_REF="${1:?Usage: $0 <image-ref>}"
CONTAINER_NAME="${CONTAINER_NAME:-smoke-django-heroes}"
HOST_PORT="${HOST_PORT:-18000}"
CONTAINER_PORT="${CONTAINER_PORT:-8000}"

if command -v docker >/dev/null 2>&1; then
  CTR_CLI="docker"
elif command -v podman >/dev/null 2>&1; then
  CTR_CLI="podman"
else
  echo "ERROR: Neither docker nor podman CLI found"
  exit 1
fi

cleanup() {
  EXIT_CODE=$?
  if [ "${EXIT_CODE}" -ne 0 ]; then
    echo "--- Container logs (${CONTAINER_NAME}) ---"
    "${CTR_CLI}" logs "${CONTAINER_NAME}" 2>&1 || true
  fi
  "${CTR_CLI}" rm -f "${CONTAINER_NAME}" >/dev/null 2>&1 || true
  exit "${EXIT_CODE}"
}
trap cleanup EXIT

echo "Using ${CTR_CLI} to start ${CONTAINER_NAME} from ${IMAGE_REF}..."
"${CTR_CLI}" run -d --name "${CONTAINER_NAME}" \
  -e DJANGO_SETTINGS_MODULE="${DJANGO_SETTINGS_MODULE:-myproject.settings}" \
  -e SECRET_KEY="${SECRET_KEY:-ci-smoke-test-secret-key}" \
  -e DEBUG="${DEBUG:-1}" \
  -p "${HOST_PORT}:${CONTAINER_PORT}" \
  "${IMAGE_REF}"

echo "Checking runtime user..."
CURRENT_USER=$("${CTR_CLI}" exec "${CONTAINER_NAME}" id -un)
echo "Container user: ${CURRENT_USER}"

echo "Running Django system check..."
"${CTR_CLI}" exec "${CONTAINER_NAME}" python manage.py check

echo "Waiting for Django on port ${CONTAINER_PORT}..."
ATTEMPTS=20
READY=0
for i in $(seq 1 "${ATTEMPTS}"); do
  if "${CTR_CLI}" exec "${CONTAINER_NAME}" python -c \
    "import urllib.request; req = urllib.request.Request('http://127.0.0.1:${CONTAINER_PORT}/', headers={'Host': 'localhost'}); resp = urllib.request.urlopen(req, timeout=2); print('HTTP status:', resp.status)" \
    2>/dev/null; then
    echo "Smoke check passed on attempt ${i}"
    READY=1
    break
  fi
  sleep 2
done

if [ "${READY}" -ne 1 ]; then
  echo "ERROR: Service did not respond within timeout"
  exit 1
fi