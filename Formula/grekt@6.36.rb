class GrektAT636 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.36.x)"
  homepage "https://grekt.com"
  version "6.36.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "5a7cb8951e0280032e2ca2ffa5fba46915ed7c9fa549d267afdcca59e8f1894e"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "3b1b5c8fa72784ce10e5ac63be634318ee5050041cc27dff24b9a8719b80069e"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "ba2dc7aa504ad70a09bc25d5635becf5ab9731dc7ee9042983df5d950fed2a41"
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
