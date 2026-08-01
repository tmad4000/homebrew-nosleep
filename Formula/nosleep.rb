class Nosleep < Formula
  desc "Keep your Mac awake (even with the lid closed) — a friendly wrapper for pmset"
  homepage "https://github.com/tmad4000/nosleep"
  url "https://github.com/tmad4000/nosleep/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "8afbf7e87d47e6f3abc9483e49c278e191e4c5a3d04de6cde40dd937f463e980"
  license "MIT"
  version "1.2.0"

  depends_on :macos

  def install
    bin.install "nosleep.sh" => "nosleep"
    bin.install_symlink "nosleep" => "nsl"
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
