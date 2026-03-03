class GrektAT642 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.42.x)"
  homepage "https://grekt.com"
  version "6.42.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "5f1a52fa5edf38ad1bf5b8e69f93a770164e784827eb8d7a14cfa98ad28471af"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "9a7f4c31c51b592c663d8b4060a336f2c6b37efe17d5328ec98213735847ef70"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "28e26add010e112786335e894257d3276358db5938daba8316d4a0853152252b"
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
