#!/bin/bash
set -e

export EXIT_STATUS=0

echo "Executing tests for branch $TRAVIS_BRANCH"

./gradlew --console=plain -Dgeb.env=chromeHeadless complete/vies-vat-validator:test || EXIT_STATUS=$?

if [[ $EXIT_STATUS -ne 0 ]]; then
  exit $EXIT_STATUS
fi

./gradlew --console=plain -Dgeb.env=chromeHeadless complete/invoice:test || EXIT_STATUS=$?

exit $EXIT_STATUS
