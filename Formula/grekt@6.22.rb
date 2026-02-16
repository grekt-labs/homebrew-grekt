class GrektAT622 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.22.x)"
  homepage "https://grekt.com"
  version "6.22.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "aa24e1dfea00953fe362648cfa587db82ba2ca58c8cb3bf85e72f9105cb2f300"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "d855d569f413de316c2063fcf75eae368b7ab02847436cd2a45b805bcef57fe6"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "93894e8137a2f1f7f1a298fa6e30c34e5a2f7bad1c70bb79d891bcf7db596988"
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
