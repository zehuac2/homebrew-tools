class StatusLine < Formula
  desc "Three-line styled terminal status bar for Claude Code"
  homepage "https://github.com/zehuac2/status-line"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/status-line/releases/download/0.4.0/status-line-darwin-arm64.tar.gz"
      sha256 "b68465b4ab7562c15f95e31940be24c4b67e08e094816b0876df5ee3f31a8bee"
    else
      odie "status-line only publishes an Apple Silicon (arm64) build for macOS"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/status-line/releases/download/0.4.0/status-line-linux-arm64.tar.gz"
      sha256 "d957d505724c5029ca9de8f9b12e198242066534ebe32be6e1d3764e1c47cc20"
    else
      url "https://github.com/zehuac2/status-line/releases/download/0.4.0/status-line-linux-x64.tar.gz"
      sha256 "778ddd57ea5d14f2ff043e23c998d7fa8c13c8bec10389dd1cd790aa6836eb86"
    end
  end

  def install
    bin.install "status-line"
  end

  test do
    system "#{bin}/status-line", "-claude"
  end
end
