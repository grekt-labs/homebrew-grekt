class GrektAT628 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.28.x)"
  homepage "https://grekt.com"
  version "6.28.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "357fd394dde8ea9ae387a6445364d5ef08e1502cabcb771c9f19146177b9065a"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "f483c22f9a3684b153fdadb92a74df5349b1461ce9baae27cea97b6fd1232d6b"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "ccfaceb5d9d4e43dbd233e0da2fcb8c55932567877d2efea654237b45596ad16"
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
