class GrektAT640 < Formula
  desc "AI artifact manager - manage and sync AI configurations across tools (6.40.x)"
  homepage "https://grekt.com"
  version "6.40.2"
  license "MIT"

  keg_only :versioned_formula

  on_macos do
    on_arm do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-arm64.tar.gz"
      sha256 "95f140b26f397154ff3474a1539a81a56478edff622b349759f5461ebac6b970"
    end
    on_intel do
      url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-macos-x64.tar.gz"
      sha256 "63f6e0cb59b417138a217ac991f3b811c76f8614f16a0e4fa9435f7aa7f16ae9"
    end
  end

  on_linux do
    url "https://github.com/grekt-labs/cli/releases/download/v#{version}/grekt-linux-x64.tar.gz"
    sha256 "155f1de84a244bf7f2a28df41b9e501576f1f4e6f37c72115f64bbf8e8888764"
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
