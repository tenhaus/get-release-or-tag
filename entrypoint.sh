#!/bin/sh -l

printenv

tag=${GITHUB_SHA}

if [ -z ${GITHUB_REF} ]; then
  tag="${GITHUB_SHA}"
else
  tag="${GITHUB_REF}"
fi

echo "::set-output name=tag::$tag"