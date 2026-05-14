class Nosleep < Formula
  desc "Keep your Mac awake (even with the lid closed) — a friendly wrapper for pmset"
  homepage "https://github.com/tmad4000/nosleep"
  url "https://github.com/tmad4000/nosleep/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "12cf1b97ea86b918f28b5407ae69d2811a5ce42585a66aa9d864ee6ec619fe2a"
  license "MIT"
  version "1.0.0"

  depends_on :macos

  def install
    bin.install "nosleep.sh" => "nosleep"
  end

  def caveats
    <<~EOS
      One-time setup (grants passwordless pmset, nothing else):
        nosleep --setup

      Try it:
        nosleep --status
        nosleep --on
        nosleep --off

      Uninstall (removes binary + sudoers rule, re-enables sleep):
        nosleep --uninstall
        brew uninstall nosleep
    EOS
  end

  test do
    assert_match "nosleep #{version}", shell_output("#{bin}/nosleep --version")
  end
end
