# The release workflow of MoSattler/stault (.github/workflows/release.yml)
# writes this cask into MoSattler/homebrew-tap for every release, with the
# version and checksums filled in. Change it there, not in the tap.
cask "stault" do
  arch arm: "arm64", intel: "x64"

  version "0.13.0"
  sha256 arm:   "6623682fd21d1206cfa380650cccdaa1305fb591ed5ba8ed596e7af9ce28b6f7",
         intel: "ca621a54e933daa38c4a64507363aa868808a2f61daa15fdd8275b0b69eb88c5"

  url "https://github.com/MoSattler/stault/releases/download/v#{version}/macos-#{arch}-Stault.dmg"
  name "Stault"
  desc "Steam-style desktop client for a self-hosted GameVault server"
  homepage "https://github.com/MoSattler/stault"

  livecheck do
    url :url
    strategy :github_latest
  end

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
