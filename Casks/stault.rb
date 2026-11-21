cask "stault" do
  version "0.1.0"
  sha256 "084ac067a35bc72329436d68fcfc04600c1a8dece58cb156ee16ef2938b82cff"

  url "https://github.com/MoSattler/stault/releases/download/v#{version}/macos-arm64-Stault.dmg"
  name "Stault"
  desc "Steam-style desktop client for a self-hosted GameVault server"
  homepage "https://github.com/MoSattler/stault"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Stault.app"

  zap trash: [
    "~/Library/Application Support/com.mosattler.stault",
    "~/Library/Caches/com.mosattler.stault",
    "~/Library/Logs/com.mosattler.stault",
  ]

  caveats <<~EOS
    Stault is not code-signed. macOS blocks the first launch; allow it under
    System Settings → Privacy & Security → Open Anyway.
  EOS
end
