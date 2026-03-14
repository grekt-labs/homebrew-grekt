class Grekt < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools"
  homepage "https://grekt.com"
  version "6.48.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "c3391d1ac0718b6b09558470af5f8771330016ff468aa78c9a07e9252f4628b4"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "46df17b69bca1cbbc985e50d1020d6053e35aad80c6ec28f6b8376a6e1b44fa1"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "3261d0a88230d46a369b2ab132f62d592cc51899b1844351994e88a16df64fce"
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
