require 'formula'

class FloMwe < Formula
  url      'https://github.com/palmer-dabbelt/flo-mwe/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-mwe'
  sha1     'acc7cc86fd4c5ced2bd7978d1ec6132e0424c8c6'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'libflo'
  depends_on 'llvm'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
