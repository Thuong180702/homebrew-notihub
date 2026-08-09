cask "notihub" do
  version "1.3.6"
  sha256 "a8512642cd71d996e41435786eff05c00978be563e78600337a2670b9b7cb4e9"

  url "https://github.com/Thuong180702/notihub/releases/download/v#{version}/notihub-v#{version}-mac.dmg"
  name "notihub"
  desc "Native notification hub for web apps (Messenger, Zalo, Gmail, etc.)"
  homepage "https://github.com/Thuong180702/notihub"

  # notihub ships its own updater (it downloads the release zip, checksums it
  # against the sha256 GitHub publishes, and replaces the bundle in place), so
  # Homebrew should not try to manage its version — same arrangement as the
  # other self-updating casks. `brew upgrade` leaves it alone unless --greedy.
  auto_updates true
  depends_on :macos

  app "notihub.app"

  zap trash: [
    "~/Library/Application Support/notihub",
    "~/Library/Preferences/io.github.thuong180702.notihub.app.plist",
    "~/Library/Saved Application State/io.github.thuong180702.notihub.app.savedState",
  ]

  caveats <<~EOS
    notihub is signed ad-hoc, not notarized by Apple (no paid Developer ID yet),
    so macOS Gatekeeper will refuse this first launch with "notihub is damaged
    and can't be opened". This isn't corruption — it's Gatekeeper rejecting an
    unnotarized app. Clear the quarantine flag once to fix it:

      xattr -dr com.apple.quarantine /Applications/notihub.app

    This applies to the install only. notihub updates itself from then on, and
    its own downloads are never quarantined.
  EOS
end
