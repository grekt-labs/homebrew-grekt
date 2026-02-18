class GrektAT624 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.24.x)"
  homepage "https://grekt.com"
  version "6.24.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "9c9c642aa943801c10b0fb939c00febc0c9cf35052e1115454b755fe2ddb7f49"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "0bba22f1493991d8dcd25a598efe643c6e6ef5a9b1a461cc4a6e2e4467f6c12f"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "ccb84c3ee5f40ce6b42de696f64713dd0a37cdefcd258b75993fef90bd92c9ae"
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
