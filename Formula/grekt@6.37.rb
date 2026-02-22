class GrektAT637 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.37.x)"
  homepage "https://grekt.com"
  version "6.37.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "e05025e4615dbab212b15a73e5f5d9f373a0e32c46781649a858db32b26737bf"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "f48032ec4d3b39c30a222daef2f859d6c737bb9bb4242993243d49efb41e8cb2"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "3dbd55b6fb5e39c9145f59336e9d885936e0060e10dd00e46290ae7973ada8c4"
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
