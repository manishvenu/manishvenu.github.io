# manishvenu.github.io

My personal site, built with [Quarto](https://quarto.org). Everything is markdown (`.qmd`) or Jupyter notebooks.

## Setup (once)

```bash
conda create -n website python=3.12 && conda activate website
pip install quarto-cli jupyter matplotlib
```

## Preview while editing

```bash
quarto preview          # opens a browser that refreshes when you save
```

## Common edits

| I want to...              | Do this                                                                       |
|---------------------------|-------------------------------------------------------------------------------|
| Add a game                | Copy `games/_template/` to `games/my-game/`, edit `index.qmd`, add `cover.png` |
| Make a game playable      | Put `{{< itch 1234567 >}}` (itch HTML5) or `{{< unity play/index.html >}}` (Unity WebGL build in `play/`) in its page |
| Add a project             | Copy any file in `projects/` (e.g. `mldjango.qmd`), edit the top block        |
| Write a blog post         | Copy `blog/posts/_template/` to `blog/posts/YYYY-MM-DD-name/` (or use `index.ipynb`) |
| Link a post hosted elsewhere | Add an entry to `blog/external-posts.yml`                                  |
| Change the home page      | `index.qmd`                                                                   |
| Change navbar / site name | `_quarto.yml`                                                                 |
| Change colours / fonts    | top of `styles/custom.scss`                                                   |

## Publishing

Push to `main`. A GitHub Action builds the site and publishes it to the `gh-pages` branch.

If a post runs Python code, preview it locally first, then commit the `_freeze/` folder it creates. That way GitHub doesn't need your Python environment.

## Unity WebGL builds

In Unity, choose File → Build Settings → WebGL. Under Player Settings → Publishing, set Compression Format to **Gzip** and turn on **Decompression Fallback** (GitHub Pages needs that). Copy the build output into the game's folder as `play/`. Each file must be under 100 MB.
