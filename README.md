# Homebrew tap

Casks for [Stault](https://github.com/MoSattler/stault), a Steam-style desktop client for a self-hosted GameVault server.

```bash
brew install --cask mosattler/tap/stault
```

Apple Silicon only. Stault is not code-signed, so macOS blocks the first launch; allow it under System Settings → Privacy & Security → Open Anyway.

`Casks/stault.rb` is updated by Stault's release workflow on every stable release.
