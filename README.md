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

`static/` is the static site generator. The published site is generated
entirely by `static/build.rb`; its output is not committed.

```
slides/<name>/      one directory per talk: slide.md, meta.toml, css/, images/
assets/             shared css/ and images/, copied to the output root
static/
  build.rb          the generator (run it with `rake build:static`)
  templates/        slide.html.erb (each talk) and index.html.erb (talk list)
  slide.rb.erb, gibier2/   Opal sources, compiled into slide.js
  gh_server.rb      serves the output under /slides like GitHub Pages
```

`meta.toml` keys: `title`, `date` (used to sort the list, newest first),
`fonts` (stylesheet URLs) and `languages` (highlight.js languages, default
`['ruby']`).

Build from the project root with rake. Opal is in the `:static` group of
the root Gemfile; the task runs `bundle install` first if needed.

```sh
rake build:static                                      # -> static/public/, no base path
rake build:static BASE_PATH=/slides                    # GitHub Pages style
rake build:static OUTPUT_DIR=_site BASE_PATH=/slides   # OUTPUT_DIR is relative to the root
rake build:static SKIP_OPAL=1                          # skip compiling slide.js
```

Serve it locally with no base path:

```sh
rake build:static && ruby -run -e httpd static/public
```

Or the way GitHub Pages serves it, under /slides:

```sh
rake build:static BASE_PATH=/slides && ruby static/gh_server.rb
```

Open http://localhost:9161/slides/ then you can see the slides.

GitHub Pages is deployed by `.github/workflows/deploy-pages.yml`
(Settings → Pages → Source must be "GitHub Actions").
