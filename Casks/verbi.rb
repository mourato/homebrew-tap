cask "verbi" do
  version "0.10.22"
  sha256 "73a2617ca59e3960425d493a22d0a6277a3fff282f307531321b22bb04c87e68"

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
