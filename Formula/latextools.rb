require 'fileutils'

class Latextools < Formula
  desc "Latex tools"
  homepage "https://github.com/Zehua-Chen/latextools"

  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/Zehua-Chen/latextools/releases/download/0.7.0/latextools-osx-arm64.tar.gz"
    sha256 "810a25f2e7721c71f2113ccad2b79a82212d347e0d3a85c81ea7708a7b1de438"
  else
    url "https://github.com/Zehua-Chen/latextools/releases/download/0.7.0/latextools-osx-x64.tar.gz"
    sha256 "8a3671b02208c4d662678c801692c11f2d2ee1daecc4f2ca93d43cc5b7e33417"
  end

  def install
    FileUtils.cp_r("latextools", prefix)
    bin.install_symlink("#{prefix}/latextools")
  end

  test do
    system "false"
  end
end
