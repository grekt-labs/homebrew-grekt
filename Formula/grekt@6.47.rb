class GrektAT647 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.47.x)"
  homepage "https://grekt.com"
  version "6.47.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "9d400f5f7b09ccf39b44112ab1806c2a32df93414ed1c52387aa13596240f09e"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "1875077c24f4134b4bd7803dd558f146c37c1bc2756c38f9b107acae708938a9"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "d20e4db52631e783650cd4c2d36dc5a7724ae071f17dcedb29fa5183d5d942f4"
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "grekt-macos-arm64" => "grekt"
      else
        bin.install "grekt-macos-x64" => "grekt"
      end
    else
      bin.install "grekt-linux-x64" => "grekt"
    end
  end

  test do
    assert_match "grekt", shell_output("#{bin}/grekt --version")
  end
end
