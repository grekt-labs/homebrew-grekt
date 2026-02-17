class GrektAT623 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.23.x)"
  homepage "https://grekt.com"
  version "6.23.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "3d7273515c6d8e69e50da12d835a68b48223c40a4721954d79d671bcca8b02b2"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "b97d8b9ad1e6d39b8da632ad0575cbda1928425a2df9490f31b9b40264b0ad26"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "6b7d3a69a0ce86ba41b04777410c1359b999a5b87fb02399276077de13c397fb"
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
