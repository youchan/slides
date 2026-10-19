## build

`slide.rb` is generated from `slide.rb.erb` and compiled with Opal. Use the
project-level `build.rb` instead of calling `opal` directly here — it also
builds `docs/*/index.html` from their `.erb` templates:

```
ruby ../build.rb
```

`BASE_PATH` controls the prefix used for same-origin asset paths
(`css/slide.js/slide.md`). Default is empty, for serving `docs/` directly
with a plain local HTTP server. GitHub Pages serves this repo under
`/slides/`, so the deploy workflow builds with `BASE_PATH=/slides`:

```
BASE_PATH=/slides ruby ../build.rb
```
