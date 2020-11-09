# Get release name or commit id

A simple action to help release docker images in a dev/prod pipeline. It will return the release name (`$GITHUB_REF` without `refs/tags/`) if the action is `release` otherwise it will return `$GITHUB_SHA`

Ex:

```
name: Publish
on: [pull_request, release]
jobs:
  build_docker_image:
    name: Flyway
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - uses: tenhaus/get-release-or-tag
        id: tag

      - name: Build
        run: docker build src/flyway -t your.docker.repo/flyway:${{ steps.tag.outputs.tag }}

      - name: Push
        run: docker push your.docker.repo/flyway:${{ steps.tag.outputs.tag }}
```
