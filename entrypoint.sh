#!/bin/sh -l

echo "Hello $1"
tag=$(date)
printenv
echo "::set-output name=tag::$tag"