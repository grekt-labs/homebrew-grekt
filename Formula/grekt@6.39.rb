class GrektAT639 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.39.x)"
  homepage "https://grekt.com"
  version "6.39.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "b131204de127a31d1671b59bee737d1c3bd55a8a3dc55e88d8a19c2710b15a2c"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "70ceb96fc5b023b68342bc1bfedb802f035c0add128e25b7ae1e1e32aa2da302"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "e33a33e08749f0d96a8278cdc3ec9675fb2d4fc320522edaba39a2997c8e55a0"
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
