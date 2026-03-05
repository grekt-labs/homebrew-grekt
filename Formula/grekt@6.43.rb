class GrektAT643 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.43.x)"
  homepage "https://grekt.com"
  version "6.43.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "3a33d49d4bf67794b0bf3b3f84174785c5d2064f31f76da0438c29f020df4759"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "05b7267876c72f4a940ca3d9ac3ecc8e9e5d30bf6df25bb91cf9ee617dcbb3c6"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "44f2830d340ca00069cdb0df1969c913f8306a3d0ad7836416cc8b5b7196f5a5"
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
