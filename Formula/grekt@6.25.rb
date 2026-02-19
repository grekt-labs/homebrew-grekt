class GrektAT625 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.25.x)"
  homepage "https://grekt.com"
  version "6.25.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "c1cbcad0d8fb52500ea4dc612f213521ac25e6e813876f593017558bac0d06b4"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "b49bb90a169982e8525c76845c5a7299a386968c7eb4029f06db3fae7fe9faa7"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "b45b8ebc0878f8640fae11b51ea3d862684cf4b0c5e5528f34e8af11110b765a"
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
