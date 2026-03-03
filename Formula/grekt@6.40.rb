class GrektAT640 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.40.x)"
  homepage "https://grekt.com"
  version "6.40.3"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "cf085b8295fe1748ab55cbdc39dc3c3731f5f980ace7b67a9854d0ea93bfb6a8"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "7376892db2bce74ab0755025c52ee16ce6595ddf16e2f624f6f96c1e67a4bc78"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "c68f6c6d464d69a32f6300080b85f66bbdace45ae03a201f1b9889a747f55a05"
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
