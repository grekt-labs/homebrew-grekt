class GrektAT644 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.44.x)"
  homepage "https://grekt.com"
  version "6.44.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "941247815fdfec11e083546d98e39665cf9bbb9faf6d7e9156db6572fe4fa9bf"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "20b7dbc2178deb6e4d12f77de16159e4af7fd9f3b31696341eab3c66d4fca135"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "c60cbb1a176c6f66ec1a9506406624cc1de22e02ec3d5de5e2044c617f77a15d"
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
