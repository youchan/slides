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
  build.rb          the generator (run it from static/)
  templates/        slide.html.erb (each talk) and index.html.erb (talk list)
  slide.rb.erb, gibier2/   Opal sources, compiled into slide.js
  gh_server.rb      serves the output under /slides like GitHub Pages
```

`meta.toml` keys: `title`, `date` (used to sort the list, newest first),
`fonts` (stylesheet URLs) and `languages` (highlight.js languages, default
`['ruby']`).

Build (needs Opal: `bundle install` in static/, or `gem install opal -v 1.8.2`):

```sh
cd static
ruby build.rb                          # -> static/public/, no base path
ruby build.rb -o ../docs -b /slides    # any output dir / base path
```

Serve it locally with no base path:

```sh
ruby build.rb && ruby -run -e httpd public
```

Or the way GitHub Pages serves it, under /slides:

```sh
ruby build.rb --base-path /slides && ruby gh_server.rb
```

Open http://localhost:9161/slides/ then you can see the slides.

GitHub Pages is deployed by `.github/workflows/deploy-pages.yml`
(Settings → Pages → Source must be "GitHub Actions").
