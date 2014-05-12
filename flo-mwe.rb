require 'formula'

class FloMwe < Formula
  url      'https://github.com/palmer-dabbelt/flo-mwe/archive/v0.0.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-mwe'
  sha1     'ee8895cbced3966866461da06f108742dfe4b605'

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
