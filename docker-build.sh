#!/usr/bin/env bash

set -e

# Find the project root (the directory containing this script).
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Docker image name.
IMAGE_NAME="gdtoml-steamdeck"

# Directories on the host.
SOURCE_DIR="${PROJECT_DIR}/gdtoml"
ARTIFACT_DIR="${PROJECT_DIR}/build"

mkdir -p "${ARTIFACT_DIR}"

# Default build command.
if [ "$#" -eq 0 ]; then
    set -- scons target=template_release
fi

echo "Building Linux shared library..."
echo "Project:   ${PROJECT_DIR}"
echo "Source:    ${SOURCE_DIR}"
echo "Artifacts: ${ARTIFACT_DIR}"
echo "Command:   $*"

# -v "${SOURCE_DIR}:/project"
# This argument maps a directory on the host to /project. "host_dir:docker_dir"

docker run --rm \
    --platform linux/amd64 \
    --user "$(id -u):$(id -g)" \
    -e ARTIFACT_DIR=/artifacts \
    -v "${SOURCE_DIR}:/project" \
    -v "${ARTIFACT_DIR}:/artifacts" \
    -w /project \
    "${IMAGE_NAME}" \
    "$@"

echo "Build completed."