class Namescan < Formula
  desc "File name scanner to detect file names that cannot be synced between OS"
  homepage "https://github.com/zehuac2/namescan"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/namescan/releases/download/0.1.1/namescan-0.1.1-macos-arm64.tar.gz"
      sha256 "92944e09345731e882b12dcbc33ad463c3517ccaacd13a5db35d7f6eb7e2447c"
    else
      url "https://github.com/zehuac2/namescan/releases/download/0.1.1/namescan-0.1.1-macos-x86_64.tar.gz"
      sha256 "0d70a4b93101402e9e323d87da1a4a50d00f4b2d9fa677c3b090042814158e63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/namescan/releases/download/0.1.1/namescan-0.1.1-linux-arm64-gnu.tar.gz"
      sha256 "9e3c4da19fae6a0b84ec77bb47a465b33229d60f5dfcf8bc020054bd118777ce"
    else
      url "https://github.com/zehuac2/namescan/releases/download/0.1.1/namescan-0.1.1-linux-x86_64-gnu.tar.gz"
      sha256 "e2c5f80a7fdc600a66d695770a099215df457038d7b139e222c0cdee8ef4a3eb"
    end
  end

  def install
    bin.install "namescan"
  end

  test do
    system "#{bin}/namescan", "--help"
  end
end
