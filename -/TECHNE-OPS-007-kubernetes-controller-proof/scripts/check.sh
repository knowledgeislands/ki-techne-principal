#!/usr/bin/env bash
set -euo pipefail

proof_root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

PYTHONDONTWRITEBYTECODE=1 python3 -c 'import pathlib; compile(pathlib.Path("'"${proof_root}"'/controller/controller.py").read_text(encoding="utf-8"), "controller.py", "exec")'
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s "${proof_root}/tests" -p 'test_*.py' -v

jq --exit-status . "${proof_root}/fixtures/targets.local.json" "${proof_root}/fixtures/targets.remote.json" "${proof_root}/fixtures/telegram-update.json" "${proof_root}/manifests/execution/job.example.json" >/dev/null

ruby "${proof_root}/scripts/validate-manifests.rb" \
  "${proof_root}/manifests/controller"/*.yaml \
  "${proof_root}/manifests/target"/*.yaml

ruby -e 'require "yaml"; ARGV.each { |path| YAML.parse_stream(File.read(path)) }' \
  "${proof_root}/cloudformation"/*.yaml

shellcheck "${proof_root}"/scripts/*.sh

if find "${proof_root}" -type d \( -name node_modules -o -name .venv -o -name venv -o -name __pycache__ \) -print -quit | grep -q .; then
  echo 'package or cache directory found' >&2
  exit 1
fi

echo 'offline checks passed'
