# manishvenu.github.io

My personal site, live at **https://manish.venumuddula.com**. Built with [Quarto](https://quarto.org).

Want to make it do more (Python plots, interactive apps, a server)? See [EXTENDING.md](EXTENDING.md).

---

## 1. How it's built

Quarto is a program that turns Markdown files into a website. Three ideas cover the whole site:

**a) Every `.qmd` file becomes one page.** A `.qmd` file is Markdown with a small settings block (YAML) at the top:

```markdown
---
title: "CrocoDash"
description: "One sentence."
---

Normal Markdown goes here.
```

**b) `_quarto.yml` is the only settings file.** Site title, navbar links, theme. That's it.

**c) A `listing:` turns a folder into a page of cards.** `projects/index.qmd` says "show every `.qmd` in this folder as a card". Each card's title, text and picture come from that file's top block. So adding a project means adding a file; the Projects page updates itself.

How files map to pages:

```
_quarto.yml                      settings for everything
index.qmd                    ->  /                          Home
projects/index.qmd           ->  /projects/                 cards for every file below
projects/crocodash.qmd       ->  /projects/crocodash.html   one project
games/index.qmd              ->  /games/                    cards for every file below
games/sub-merged-conflicts.qmd ->  /games/sub-merged-conflicts.html
blog/index.qmd               ->  /blog/                     list of posts in blog/posts/
blog/posts/_example.qmd          (ignored: starts with "_". Copy it to write a post)
404.qmd                      ->  shown for broken links
images/                          all pictures
CNAME                            tells GitHub the custom domain
environment.yml                  mamba environment with Quarto in it
.github/workflows/publish.yml    builds + publishes when you push
_site/                           the built HTML (generated, not committed)
```

## 2. Setup (once)

```bash
mamba env create -f environment.yml
```

## 3. Edit and preview

```bash
mamba activate website
quarto preview          # opens your browser; the page reloads every time you save a file
```

Press `Ctrl+C` to stop. To just build without a browser: `quarto render` (output goes to `_site/`).

## 4. The top block (YAML header)

These are the only fields used on this site:

| Field         | What it does                                              | Used in        |
|---------------|-----------------------------------------------------------|----------------|
| `title`       | Page title, and the card title                            | everything     |
| `description` | The sentence on the card                                  | projects, games, posts |
| `date`        | Sorting (newest first) and shown on the card. `YYYY-MM-DD` | projects, posts |
| `image`       | Picture on the card. Path is relative to the file, e.g. `../images/x.png` | projects, games |

## 5. How do I...

| I want to...                 | Do this |
|------------------------------|---------|
| Add a project                | Copy any file in `projects/` to a new name, edit it. Put its picture in `images/`. |
| Write a blog post            | Copy `blog/posts/_example.qmd` to `blog/posts/2026-12-01-my-post.qmd` (no `_` at the start), edit it. |
| Add a game                   | Copy `games/sub-merged-conflicts.qmd` to a new name, edit it. Picture in `images/`. |
| Make a game playable in the browser | See below. |
| Change the home page         | Edit `index.qmd`. |
| Add/remove a navbar link     | Edit `navbar:` in `_quarto.yml`. |
| Change colours/fonts         | Change `theme:` in `_quarto.yml` to another name from [bootswatch.com](https://bootswatch.com) (e.g. `flatly`, `litera`). |
| Add an image to a page       | `![Caption](../images/pic.png){width=60%}` |
| Add a button                 | `[Text](https://link){.btn .btn-primary}` (use `.btn-outline-primary` for a lighter one) |
| Hide a page for now          | Rename it to start with `_`. |

### Make a game playable in the browser

Paste one of these into the game's `.qmd` on its own lines.

**itch.io HTML5 game** (get the number from itch's "Embed game" button):

```html
<iframe src="https://itch.io/embed-upload/1234567?color=000000"
        width="960" height="600" allowfullscreen style="border:0; max-width:100%"></iframe>
```

**Unity WebGL build hosted here:** in Unity, File → Build Settings → WebGL. Under Player Settings → Publishing set Compression Format to **Gzip** and turn on **Decompression Fallback**. Copy the build output to `games/my-game-play/`, add that folder to `resources:` in `_quarto.yml` (so Quarto copies it unchanged), and embed it:

```html
<iframe src="my-game-play/index.html"
        width="960" height="600" allowfullscreen style="border:0; max-width:100%"></iframe>
```

GitHub rejects files over 100 MB.

## 6. Publishing

Commit and push to `main`. That's all.

The GitHub Action in `.github/workflows/publish.yml` installs Quarto, runs `quarto render`, and pushes the result to the `gh-pages` branch, which GitHub Pages serves. It takes about a minute. If the site doesn't update, open the **Actions** tab on GitHub and click the red run to see the error; it's usually the same error `quarto render` shows locally.

Never edit the `gh-pages` branch by hand.

## 7. Custom domain (manish.venumuddula.com)

The `CNAME` file and `site-url` in `_quarto.yml` are already set. You need to do these once:

1. At whoever hosts DNS for `venumuddula.com`, add a record:
   - Type: **CNAME**, Host/Name: **manish**, Value/Target: **manishvenu.github.io**
2. On GitHub: repo → **Settings → Pages → Custom domain**: enter `manish.venumuddula.com`, Save. Wait for the green DNS check (minutes to a few hours), then tick **Enforce HTTPS**.
3. Optional but recommended: GitHub (your profile) → **Settings → Pages → Add a domain** to verify `venumuddula.com`, so nobody else can claim it on GitHub.

After that, `manishvenu.github.io` redirects to the new domain automatically.
