class GrektAT641 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.41.x)"
  homepage "https://grekt.com"
  version "6.41.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "db899685036580c2a712c48c62b88b06e59c324e79c834c652dfc204d24bce0f"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "c002462f55d38ac9a40157e02657301ca550e46b58a1b214d8cb12a16efd284d"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "f0ec8be6a0fdd7da0f9552476d2e218634fae6a4bd66a40c5699f742312c7fab"
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
