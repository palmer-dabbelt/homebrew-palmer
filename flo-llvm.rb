require 'formula'

class FloLlvm < Formula
  url      'https://github.com/palmer-dabbelt/flo-llvm/archive/v0.0.21.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-llvm'
  sha1     'f9b8eb4de05f541f10e8918f20bc405606188047'

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
