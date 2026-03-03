class GrektAT642 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.42.x)"
  homepage "https://grekt.com"
  version "6.42.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "e5d8067f30588959d610302f738aecb8a5002f6fea7165733076af43dcc6b7a5"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "dc8734fdfe2b1598e67b237e49f5618c7d3f35866182af8f3dad446a08feca12"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "b81df69b05a56284944a920f05dea66b291343778a7a34c534d3b627afe0eb99"
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
