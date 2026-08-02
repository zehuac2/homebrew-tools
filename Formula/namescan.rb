class Namescan < Formula
  desc "File name scanner to detect file names that cannot be synced between OS"
  homepage "https://github.com/zehuac2/namescan"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/namescan/releases/download/0.1.2/namescan-0.1.2-macos-arm64.tar.gz"
      sha256 "c4b59adece8fc0865fecb026e8e908cb6633f68f402619e9a8e34b4c7ff0a5bd"
    else
      url "https://github.com/zehuac2/namescan/releases/download/0.1.2/namescan-0.1.2-macos-x86_64.tar.gz"
      sha256 "34185532feac2c9d7673dd4a355a0792a95e4edf62b76ddb8460d2e4078eb9ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/zehuac2/namescan/releases/download/0.1.2/namescan-0.1.2-linux-arm64-gnu.tar.gz"
      sha256 "03e648e487594d8b23da6c8f5067aae912f4ed21a803b13432434b8612d4f47f"
    else
      url "https://github.com/zehuac2/namescan/releases/download/0.1.2/namescan-0.1.2-linux-x86_64-gnu.tar.gz"
      sha256 "b85189a89bba052bc5555265cfd8ff7db4b58033108a44b026a3160db7b929a3"
    end
  end

  def install
    bin.install "namescan"
  end

  test do
    system "#{bin}/namescan", "--help"
  end
end
