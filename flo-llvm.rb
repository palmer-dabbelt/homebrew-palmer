require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/flo-llvm/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-llvm'
  sha1     'bdf324a6cb8c0d3b8ba81da073ad96123abb9bb8'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'llvm'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
