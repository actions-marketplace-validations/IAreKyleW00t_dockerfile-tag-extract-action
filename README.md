# Dockerfile Tag Extract Action

[![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/IAreKyleW00t/dockerfile-tag-extract-action?label=version)](https://github.com/IAreKyleW00t/dockerfile-tag-extract-action/tags)
[![License](https://img.shields.io/github/license/IAreKyleW00t/dockerfile-tag-extract-action)](https://github.com/IAreKyleW00t/dockerfile-tag-extract-action/blob/main/LICENSE)

A very basic GitHub Action that will extract all of the tags within a given Dockerfile, useful if you're trying to compare against an external source.

**This is purely for practice and demonstration purposes,** please don't use this in production.

## Usage

```yaml
name: Versions
on:
  push:
    branches:
      - main
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v3

      - name: Dockerfile tags
        id: dockerfile
        uses: iarekylew00t/dockerfile-tag-extract-action@v1

      - name: List tags
        run: |
          echo "Found tags: ${{ steps.dockerfile.outputs.tags }}"
```

## Building

You can easily build the Docker image locally by doing

```sh
docker build -t dockerfile-tag-extract .
```

## Contributing

Feel free to contribute and make things better by opening an [Issue](https://github.com/IAreKyleW00t/dockerfile-tag-extract-action/issues) or [Pull Requests](https://github.com/IAreKyleW00t/dockerfile-tag-extract-action/pulls).

## License

See [LICENSE](https://github.com/IAreKyleW00t/dockerfile-tag-extract-action/blob/main/LICENSE).
