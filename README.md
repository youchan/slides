# gibier2

A slide tool inspired [Rabbit](https://rabbit-shocker.org/en/usage/rabbit-slide.html).

This is a slide app using ruby.wasm.

## Setup

Clone the repo and bundle install ruby.wasm and etc...
```sh
git clone https://github.com/youchan/gibier2
cd gibier2/wasm
bundle install
```

Build ruby.wasm including necessary gems.
```sh
cd wasm
bundle exec rbwasm build -o dist/ruby.wasm
```

Pack gibier2 source code into ruby.wasm
```sh
bundle exec rbwasm pack ../public/wasm/ruby.wasm --dir ./src::/src -o ../public/wasm/app.wasm
```

Setup server-side
```sh
cd ..
bundle install
```

## How to run

Run gibier server
```sh
bundle exec rackup
```

Open http://localhost:9161 then you can see the sample slide.

## Static build (GitHub Pages)

The published site is generated entirely by `build.rb`; nothing under the
output directory is committed.

```
slides/<name>/   one directory per talk: slide.md, meta.toml, css/, images/
templates/       slide.html.erb (each talk) and index.html.erb (talk list)
assets/          shared css/ and images/, copied to the output root
src/             Opal sources, compiled into slide.js
```

`meta.toml` keys: `title`, `date` (used to sort the list, newest first),
`fonts` (stylesheet URLs) and `languages` (highlight.js languages, default
`['ruby']`).

Build (requires `gem install opal -v 1.8.2`):

```sh
ruby build.rb                          # -> static/, no base path
ruby build.rb -o docs -b /slides       # any output dir / base path
```

Serve it locally with no base path:

```sh
ruby build.rb && ruby -run -e httpd static
```

Or the way GitHub Pages serves it, under /slides:

```sh
ruby build.rb --base-path /slides && ruby gh_server.rb
```

Open http://localhost:9161/slides/ then you can see the slides.

GitHub Pages is deployed by `.github/workflows/deploy-pages.yml`
(Settings → Pages → Source must be "GitHub Actions").
