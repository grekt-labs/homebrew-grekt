class GrektAT635 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.35.x)"
  homepage "https://grekt.com"
  version "6.35.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "388f92549f4d441787cc4143abeaa0f1a25c353c0c2faeedcbdaca102a591fdb"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "93f69a4e0ec0edabfe3eb2a9227dcb6133cefa3eb8e81f58f506edfc58e83341"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "2e4795da1d8fa3d05033cd262fb76d1be3a581844bc54ea1c7115e8e0b77a0c0"
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
