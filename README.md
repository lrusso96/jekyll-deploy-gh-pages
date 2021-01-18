# Jekyll GitHub Pages Deploy Action

Based on [this action](https://github.com/joshlarsen/jekyll4-deploy-gh-pages).

### Setup

1. Create the nested folder `.github/workflows` at the base of your Jekyll project (don't forget the dot!)
2. Create this `main.yml` inside that workflows folder:

```yaml
name: Jekyll Deploy

on:
  push:
    branches:
      - master

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - name: GitHub Checkout
        uses: actions/checkout@v1
      - name: Bundler Cache
        uses: actions/cache@v1
        with:
          path: vendor/bundle
          key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
          restore-keys: |
            ${{ runner.os }}-gems-
      - name: Build & Deploy to GitHub Pages
        uses: lrusso96/jekyll-deploy-gh-pages@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_REPOSITORY: ${{ secrets.GITHUB_REPOSITORY }}
          GITHUB_ACTOR: ${{ secrets.GITHUB_ACTOR }}
```



### Custom Build Directory

If you use a directory other than `_site` as the Jekyll build destination, set it with the `JEKYLL_DESTINATION` variable.

```yaml
name: Jekyll Deploy

on:
  push:
    branches:
      - master

jobs:
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - name: GitHub Checkout
        uses: actions/checkout@v1
      - name: Bundler Cache
        uses: actions/cache@v1
        with:
          path: vendor/bundle
          key: ${{ runner.os }}-gems-${{ hashFiles('**/Gemfile.lock') }}
          restore-keys: |
            ${{ runner.os }}-gems-
      - name: Build & Deploy to GitHub Pages
        uses: lrusso96/jekyll-deploy-gh-pages@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_REPOSITORY: ${{ secrets.GITHUB_REPOSITORY }}
          GITHUB_ACTOR: ${{ secrets.GITHUB_ACTOR }}
          JEKYLL_DESTINATION: docs
```