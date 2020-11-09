#!/bin/sh -l

if [ "-z" ${GITHUB_SHA} ]; then
  export GITHUB_SHA=7dd2b57bb0ff93fd830a7c6346b5d35257594389
fi

if [ "-z" ${GITHUB_REF} ]; then
  export GITHUB_REF=refs/tags/0.10
fi


# Test Release
export GITHUB_EVENT_NAME=release
out=$(./entrypoint.sh)

if [ "$out" != "::set-output name=tag::0.10" ]; then
  echo "Release\nexpected ::set-output name=tag::0.10 \ngot $out"
  exit 1
fi

# Test Non-Release
export GITHUB_EVENT_NAME=push

out=$(./entrypoint.sh)

if [ "$out" != "::set-output name=tag::$GITHUB_SHA" ]; then
  echo "Non-Release\nexpected ::set-output name=tag::$GITHUB_SHA \ngot $out"
  exit 1
fi