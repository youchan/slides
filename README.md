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

## Development server (no build)

`exe/gibier server` serves every talk straight from its sources, with the
same URLs as the static build. Nothing has to be built first:

- `slide.md`, `css/`, `images/` and `assets/` are served as they are on disk
- `slide.js` is compiled with Opal in the server process on first request,
  and again only when `static/slide.rb.erb` or `lib/gibier/client/` change
- open pages reload themselves (and keep the current page) when a file they
  depend on changes

```sh
bundle install
exe/gibier server                     # http://localhost:9161/
exe/gibier server -p 3000             # another port
exe/gibier server --base-path /slides # http://localhost:9161/slides/, like GitHub Pages
exe/gibier server --help              # all options
```

The code is in `lib/gibier/server.rb`. `exe/gibier` uses the repository
Gemfile, so `bundle exec` is optional.

## Static build (GitHub Pages)

The site is built by hand into `docs/` and committed; GitHub Pages serves
that folder (Settings → Pages → Source: "Deploy from a branch", `main` /
`/docs`). Nothing is built on GitHub Actions.

```
slides/<name>/      one directory per talk: slide.md, meta.toml, css/, images/
assets/             shared css/ and images/ (the engine stylesheet and its images)
static/
  build.rb          the generator (run it through rake)
  templates/        slide.html.erb (each talk) and index.html.erb (talk list)
  slide.rb.erb      Opal entry point of the engine (slide.js)
  gh_server.rb      serves docs/ under /slides like GitHub Pages
lib/gibier/
  client/           Gibier::Client: Markdown -> pages parser (runs in the browser via Opal)
  meta.rb           meta.toml reader
  server.rb         the development server (exe/gibier server)
docs/               the published site (generated, committed)
  index.html        talk list
  js/slide_<version>.js, .css   released engines
  images/           assets/images/
  <name>/           a built talk
```

### Engine versions

The engine (slide.js and its stylesheet, `assets/css/highlight.css` +
`application.css`) is released under a version name you choose, and each
talk is pinned to one, so improving the engine never breaks an older talk.

```sh
rake engine:release VERSION=v1           # -> docs/js/slide_v1.js, docs/js/slide_v1.css
rake engine:release VERSION=v1 FORCE=1   # overwrite v1 (existing versions are refused otherwise)
rake engine:list                         # released versions
```

### meta.toml

```toml
title = 'RubyKaigi 2026'
date = '2026-04'                 # sorts the list, newest first
engine_version = 'v1'            # required for the static build
fonts = ['https://...']          # stylesheet URLs (optional)
languages = ['ruby', 'c']        # highlight.js languages (default ['ruby'])
```

### Building talks

```sh
rake build SLIDE=RubyKaigi2026           # one talk, then docs/index.html
rake build SLIDE=RubyKaigi2026,RubyKaigi2025
rake build ALL=1                         # every talk, each with its own engine_version
rake build:index                         # docs/index.html only
```

`rake build` fails if `engine_version` is missing or that version has not
been released. It replaces only `docs/<name>/`; other talks and released
engines are left alone. The talk list shows every talk that has been built
into `docs/`. All URLs are relative, so the output works under any base path.

Check it locally the way GitHub Pages serves it, then commit `docs/`:

```sh
ruby static/gh_server.rb                 # http://localhost:9161/slides/
git add docs && git commit
```

The development server (`exe/gibier server`) always uses the engine being
developed, whatever `engine_version` says.
