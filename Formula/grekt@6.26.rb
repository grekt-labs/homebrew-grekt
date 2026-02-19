class GrektAT626 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.26.x)"
  homepage "https://grekt.com"
  version "6.26.0"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "03e0a9221470a8b7b1610906cc43550b32ec188d8e63a94b562ceb0a97a4a78e"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "4390f4df032b74c940d39f32159c450b97f6ee868fc7d227cb42c9965a559d19"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli-releases/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "29a6c3edb94c56f1ab35594b6291a662662738fecc131e6834a57dcbb5794a15"
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
