#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df213fdad10b00013a25301/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df213fdad10b00013a25301
curl -s -X POST https://api.stackbit.com/project/5df213fdad10b00013a25301/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5df213fdad10b00013a25301/webhook/build/publish > /dev/null
