cask "stault" do
  version "0.8.0"
  sha256 "c38e05ffb4deff46c8022a48f188b38453e4fa46ae0340903dcc5d07e1afb007"

  url "https://github.com/MoSattler/stault/releases/download/v#{version}/macos-arm64-Stault.dmg"
  name "Stault"
  desc "Steam-style desktop client for a self-hosted GameVault server"
  homepage "https://github.com/MoSattler/stault"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Stault.app"

  # The app bundle has no sealed signature, and macOS reports a quarantined
  # copy of such an app as damaged. Drop this once the build is signed and
  # notarized.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Stault.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.mosattler.stault",
    "~/Library/Caches/com.mosattler.stault",
    "~/Library/Logs/com.mosattler.stault",
  ]

  caveats <<~EOS
    Stault is not code-signed. This cask removes the quarantine flag from the
    app so that macOS opens it, which skips the Gatekeeper check.
  EOS
end
