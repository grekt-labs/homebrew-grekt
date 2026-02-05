class Grekt < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools"
  homepage "https://grekt.com"
  version "6.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "724ef181c03aceff31028a3ced980086a047b2964dbbd12c1db1031fa862eb63"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "f96fbfc60b13e528c156db28136b43195b795fad726f4e9b38ffcccdc606f11f"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "5500174bf287baa3e4303536918f6104199e2fd849757752e92c53335e8e93bc"
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
