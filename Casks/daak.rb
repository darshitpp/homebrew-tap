# DRAFT cask for darshitpp/homebrew-tap (Casks/daak.rb).
# scripts/release.sh sets version and sha256 from the real .dmg.
cask "daak" do
  version "0.1.5"
  sha256 "b1f6eccb45bfb9a0dd8a2b486b367e7894de0e5079495734c3895c4f2e0a7fb3"

  url "https://github.com/darshitpp/daak/releases/download/v#{version}/Daak-#{version}.dmg"
  name "Daak"
  desc "Send files and text between your own devices over the local network"
  homepage "https://github.com/darshitpp/daak"

  depends_on macos: :sonoma

  app "Daak.app"

  zap trash: [
    "~/Library/Containers/dev.darshit.daak",
    "~/Library/Group Containers/J6NNRLDUG4.group.dev.darshit.daak",
  ]

  caveats <<~EOS
    Apple has not notarized Daak. Gatekeeper blocks the first open.
    Remove the quarantine flag once, then open the app:

      xattr -dr com.apple.quarantine /Applications/Daak.app
  EOS
end
