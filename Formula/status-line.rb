class StatusLine < Formula
  desc "Three-line styled terminal status bar for Claude Code"
  homepage "https://github.com/zehuac2/status-line"
  version "0.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/status-line/releases/download/0.3.1/status-line-darwin-arm64.tar.gz"
      sha256 "09d75304170e9ced58d6a622d869ce403815b4a36e4e2f1d86ad24bd8761a223"
    else
      odie "status-line only publishes an Apple Silicon (arm64) build for macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/status-line/releases/download/0.3.1/status-line-linux-arm64.tar.gz"
      sha256 "efe08130151c8297d97d0cd8496aa65c54eb0a82d89c1372a5223a7d90c354ef"
    else
      url "https://github.com/zehuac2/status-line/releases/download/0.3.1/status-line-linux-x64.tar.gz"
      sha256 "700be37821c633de7493f758007c76247b3e2cda9480ee33d39a7ddbd3934cec"
    end
  end

  def install
    bin.install "status-line"
  end

  test do
    system "#{bin}/status-line", "-claude"
  end
end
