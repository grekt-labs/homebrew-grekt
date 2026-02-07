class Grekt < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools"
  homepage "https://grekt.com"
  version "6.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "16396d349c8eee2becfae3e00ef14dba199836cf1782ccaa4c429af294d89ab9"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "9cd6e31a5f8b93b830f21104435137469ffe69b25f4ac05a152fb4bcce6fceeb"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "a04ee8e9afbd7e731b7c2ea3283bc50962724c42fa603c69714729e5b7274483"
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
