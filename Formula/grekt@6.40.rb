class GrektAT640 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.40.x)"
  homepage "https://grekt.com"
  version "6.40.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "63934a97975a559561c51a2b700e27a047758cfd5537013c2120c0911add0de2"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "659e43fcbdc3558bef9318b44d8518e7315fa78d3f33b5f6c7db84601c993a61"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "3400cb62ac6ff98ffd0a13cbb6185c69c237c0a2e1609e5bce06664b71a31bdc"
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
