class GrektAT645 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.45.x)"
  homepage "https://grekt.com"
  version "6.45.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "d60fa6ab21ffac9afb63c96484560b1cbd11cc4b255d6552d212df57999b4db5"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "d3bffd47f06fbd4e2c695b9551cefd05ed5796a37bccb598471a1db4fb6b8336"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "ae66f313b04c9d3ed0d2b7636a44dbbf8f55a3b8c2b526e1091091b798bc4830"
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
