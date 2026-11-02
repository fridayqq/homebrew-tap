cask "browser-zero" do
  version "0.1.0"
  sha256 "8c41f71003c7e41c8c02bf8d18a724da2102a3031a556a2216865948236c0701"

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
