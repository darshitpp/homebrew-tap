# DRAFT cask for darshitpp/homebrew-tap (Casks/daak.rb).
# scripts/release.sh sets version and sha256 from the real .dmg.
cask "daak" do
  version "0.1.4"
  sha256 "07099b220e5cc7c60456e36535eae113df1e4c1b11e470adcb548392e9c05a26"

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
