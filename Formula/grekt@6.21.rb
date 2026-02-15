class GrektAT621 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.21.x)"
  homepage "https://grekt.com"
  version "6.21.1"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "5f7d3ffcaac82b6170896510fec41d854ce802a1177ffdb8a35114dbe939c782"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "20690b36e66ccdb91948c1f8210516af3365edf4d45017bc61905d5945961d96"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "8db10c1fe17a6b21322a845f6f824cbbe1112cbe742d1808c7f31f6e9fd45a4a"
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
