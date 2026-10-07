cask "verbi" do
  version "0.10.6"
  sha256 "1c45365362c782d0ae5ef4debe64aedd7cc0eb7df5eef77d1c0d3b3c66f034fd"

  url "https://github.com/mourato/verbi/releases/download/v#{version}/Verbi-#{version}.zip"
  name "Verbi"
  desc "Local-first meeting capture, transcription and AI post-processing"
  homepage "https://github.com/mourato/verbi"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Verbi.app"

  # Releases are signed with a stable self-signed certificate but not notarized.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Verbi.app"],
        writable_paths: ["{{appdir}}/Verbi.app"]
  end

  zap trash: [
    "~/Library/Application Support/Verbi",
    "~/Library/Caches/com.mourato.verbi",
    "~/Library/Logs/Verbi",
    "~/Library/Preferences/com.mourato.verbi.plist",
  ]
end
