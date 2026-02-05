class Grekt < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools"
  homepage "https://grekt.com"
  version "5.19.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "5673e4ef700961797ba165bdaffe81b5de748f3c86e1ae2509a69b2d1b38a22b"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "cd33459e10d8414c8aae93a901f4ca1879b59ace5c09fb63e5e096878b1415cf"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "f52bcd24eb5c35c66b32b838300d3babf526a779798410adace419643e72bf07"
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
