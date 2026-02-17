class GrektAT624 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.24.x)"
  homepage "https://grekt.com"
  version "6.24.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "741a0276fbbcec243c17572ec65af7a625972691ca31e8346e70c870ff2b7ca7"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "2a4847c3c0ab75563a6e24e90c94856654c6075866b90865183dba052dfb8424"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "b764f5f1cabf33c63b504ae7c33e6694dc6810fa7d33159b81cc5a29af871a40"
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
