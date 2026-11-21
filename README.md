# Homebrew tap

Casks for [Stault](https://github.com/MoSattler/stault), a Steam-style desktop client for a self-hosted GameVault server.

```bash
brew install --cask mosattler/tap/stault
```

Apple Silicon and macOS 14 (Sonoma) or newer only. Stault is not code-signed. The cask removes the quarantine flag from the app so that macOS opens it, which skips the Gatekeeper check.

`Casks/stault.rb` is updated by Stault's release workflow on every stable release.
