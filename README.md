# Homebrew Tap for grekt

## Install

```bash
brew tap grekt-labs/grekt
brew install grekt
```

## Update

```bash
brew update
brew upgrade grekt
```

---

## Release Process (Maintainers)

The Homebrew formula is updated automatically when a new version is released.

### Trigger

Push a version tag to `grekt-labs/cli`:

```bash
git tag v2.1.0
git push origin v2.1.0
```

### What happens

1. **CLI `release.yml` workflow**:
   - Builds binaries (linux-x64, macos-arm64, macos-x64)
   - Creates tarballs with SHA256 checksums
   - Publishes Release to `grekt-labs/cli-releases`
   - Triggers `repository_dispatch` to this repo

2. **This repo `update-formula.yml` workflow**:
   - Downloads SHA256 checksums from cli-releases
   - Updates `Formula/grekt.rb` with new version and checksums
   - Commits and pushes automatically

### Required Secrets (in grekt-labs/cli)

| Secret | Purpose |
|--------|---------|
| `RELEASES_REPO_TOKEN` | Create releases in `cli-releases` |
| `HOMEBREW_TAP_TOKEN` | Trigger dispatch to this repo |

### Manual Update (if needed)

If the automatic process fails, update the formula manually:

1. Get SHA256 checksums from the release
2. Update `Formula/grekt.rb` with new version and checksums
3. Commit and push
