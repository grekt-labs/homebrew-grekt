class Grekt < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools"
  homepage "https://grekt.dev"
  version "2.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "5801f256af2dda99cdf7b066b9ba60025d187baf5b98374db3b535da0ad74da7"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "27c4626cb0e0cc1feaca17083ac00cc701d2ca1eb4750ba6de261cb3341be180"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "de6ab630b73d7e5e4caff2cfa627e35b7667ef4f539fd400859c2c17aed81fe7"
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
