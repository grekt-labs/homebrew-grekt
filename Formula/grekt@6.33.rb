class GrektAT633 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.33.x)"
  homepage "https://grekt.com"
  version "6.33.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "239fd2dbec19f715373df2c103a7e5e3f429714b0e9ce33bbac24ee442233192"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "837c2ac6aca64cd541607818421782ff6320b96bda04cf0968bcbd793b1d8d00"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "8d855b1d2e219f62d58043203da6f23702173c57ec39331193015fe6a8de7c6c"
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
