require 'fileutils'

class Latextools < Formula
  desc "Latex tools"
  homepage "https://github.com/Zehua-Chen/latextools"
  url "https://github.com/Zehua-Chen/latextools/releases/download/0.1.0/latextools-osx-x64.zip"
  sha256 "87d5c1e2788b7ac83c1c6fb6d10aedaa97101c224cacad36b35d98cc9243b28d"

  def install
    FileUtils.cp_r ".", "#{prefix}"
    bin.install_symlink "#{prefix}/latextools"
  end

  test do
    system "false"
  end
end
