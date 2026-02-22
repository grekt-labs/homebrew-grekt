class GrektAT634 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.34.x)"
  homepage "https://grekt.com"
  version "6.34.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "d4276135bbbaf55c50d5b9a50a0c41c8d47d0b642023dd934cf2374e146bfbc1"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "cce97594543f28de8b0a98ea61f17b3e62b58f32649ca587ecdbed93ab3cacff"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "c0df8d3fdae5854b4e208ad5d8887e12a7fd15236a10abb40d50188315693fbc"
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
