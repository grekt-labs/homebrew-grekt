class Grekt < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools"
  homepage "https://grekt.com"
  version "6.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "d67da8508defa18b3df9b0545092dfa03441163b860b42d52f0d497a4e5ea42b"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "e93fd4403a03f2695df6a8f6df88cd03ef73f4d67f2c1341e766183aa0852c36"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "cf0a6889d5225cda14c0cb751eae64fef7b836f6c85cb8779a04cc0befe7d31c"
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
