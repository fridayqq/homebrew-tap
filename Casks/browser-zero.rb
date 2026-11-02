cask "browser-zero" do
  version "0.1.1"
  sha256 "63ed39d3c0f809e77019cf79695d28a7685a46cc497b9967d766358f60e54f54"

  url "https://github.com/fridayqq/BrowserZero/releases/download/v#{version}/BrowserZero-#{version}.zip"
  name "Browser Zero"
  desc "Pick a browser, Arc or Zen space, or Chromium profile for every link"
  homepage "https://github.com/fridayqq/BrowserZero"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "BrowserZero.app"

  # Releases are not notarized yet; clear the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/BrowserZero.app"]
  end

  uninstall quit: "dev.fridayqq.BrowserZero"

  zap trash: [
    "~/Library/Application Support/BrowserZero",
    "~/Library/Preferences/dev.fridayqq.BrowserZero.plist",
    "~/Library/Saved Application State/dev.fridayqq.BrowserZero.savedState",
  ]
end
