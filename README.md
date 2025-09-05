# homebrew-intelligent-terminal

Personal Homebrew tap for **Intelligent Terminal**.

## Quick start

```bash
brew tap gabrieletanzi/intelligent-terminal
brew install intelligent-terminal
```

## Updating the formula (manual)

1. Build a new release (wheel + sdist) and upload to GitHub Releases.
2. Compute SHA256 of the tarball:
   ```bash
   shasum -a 256 intelligent-terminal-<VERSION>.tar.gz
   ```
3. Edit `Formula/intelligent-terminal.rb`:
   - Replace `PUT_TARBALL_URL_HERE` with the release tarball URL
   - Replace `PUT_SHA256_CHECKSUM_HERE` with the checksum
4. (Optional) Vendor Python resources for stricter reproducibility:
   ```bash
   brew update-python-resources Formula/intelligent-terminal.rb
   ```
5. Commit and push.

## Auto-update via GitHub Actions (recommended)

If you use the workflow we provided in the main repo, set `TAP_REPO` to this repository name (e.g. `gabrieletanzi/homebrew-intelligent-terminal`) and provide a `TAP_TOKEN` secret. The workflow will open a PR here replacing the URL and SHA256 automatically on each tag (vX.Y.Z).

## License

MIT © 2025 Gabriele Tanzi
# homebrew-intelligent-terminal
