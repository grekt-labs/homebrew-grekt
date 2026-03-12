class GrektAT646 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.46.x)"
  homepage "https://grekt.com"
  version "6.46.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "88013b17350860143681059d4edf22af788d8d9575d20e6de289ae25bbda9255"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "267891327389dcafd1faec5d3f49c5e223238dab5e9d9331f9050e9c1268c65f"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "87bd74b1d7533bdd42f6e9f56a6001f22c3d06e69798fd7b8dfbfd04fb767ca5"
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
