#!/usr/bin/env bash

set -e

echo 'Check glib versions'

objdump -T build/gdtoml.linux.template_release.x86_64.so \
| grep -o 'GLIBC_[0-9.]*' \
| sort -Vu \
| tail -1

ldd build/gdtoml.linux.template_release.x86_64.so
