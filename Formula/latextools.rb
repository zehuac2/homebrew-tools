require 'fileutils'

class Latextools < Formula
  desc "Latex tools"
  homepage "https://github.com/Zehua-Chen/latextools"
  url "https://github.com/Zehua-Chen/latextools/archive/refs/tags/0.5.1.zip"
  sha256 "d13b91bc8eb062f4ee4cd9ddea8c4a18088033d6a67be61ee6420aba942a4c15"
  license "MIT"

   depends_on "dotnet-sdk" => :build

  def install
    Dir.chdir("src/latextools")

    system "dotnet", "publish", "-c", "Release", "-r", "osx-x64"
    Dir.mkdir "unzip"
    FileUtils.mv "latextools-osx-x64.zip" "unzip/latextools-osx-x64.zip"
    system "unzip", "unzip/latextools-osx-x64.zip"
    FileUtils.cp_r "unzip/", "#{prefix}"
    bin.install_symlink "#{prefix}/latextools"
  end

  test do
    system "false"
  end
end
