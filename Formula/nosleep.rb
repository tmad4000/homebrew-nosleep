class Nosleep < Formula
  desc "Keep your Mac awake (even with the lid closed) — a friendly wrapper for pmset"
  homepage "https://github.com/tmad4000/nosleep"
  url "https://github.com/tmad4000/nosleep/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "7e10dd04203dffe71f1d55784f578afefeb1dfaaeb5a466fbd19dcdf0047bdf7"
  license "MIT"
  version "1.0.2"

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
