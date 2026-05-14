# homebrew-nosleep

Homebrew tap for [`nosleep`](https://github.com/tmad4000/nosleep) — a tiny bash utility that keeps your Mac running with the lid closed.

## Install

```bash
brew install tmad4000/nosleep/nosleep
```

That single command will:
1. Add this tap (the formula repo)
2. Install the `nosleep` binary to `$(brew --prefix)/bin/nosleep`

Then run the one-time setup so `nosleep` doesn't prompt for your password every invocation:

```bash
nosleep --setup
```

## Uninstall

```bash
nosleep --uninstall    # removes /etc/sudoers.d/pmset and re-enables sleep
brew uninstall nosleep
brew untap tmad4000/nosleep
```

## Updating the formula after a new release

1. Tag the new release in the [main repo](https://github.com/tmad4000/nosleep):
   ```bash
   cd ~/code/nosleep
   git tag vX.Y.Z && git push --tags
   gh release create vX.Y.Z --generate-notes
   ```
2. Compute the SHA256 of the release tarball:
   ```bash
   curl -fsSL https://github.com/tmad4000/nosleep/archive/refs/tags/vX.Y.Z.tar.gz | shasum -a 256
   ```
3. Update `Formula/nosleep.rb` with the new `url`, `version`, and `sha256`.
4. Commit + push to this repo. Homebrew picks up the change on the next `brew update`.

## Why a tap, not homebrew-core?

Homebrew-core requires the package to be notable (e.g. 75+ GitHub stars and 30+ forks for new submissions) and stable. Submitting to homebrew-core is a future goal — `brew tap` is the path that works on day one.
