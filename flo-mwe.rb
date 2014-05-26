require 'formula'

class FloMwe < Formula
  url      'https://github.com/palmer-dabbelt/flo-mwe/archive/v0.0.5.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-mwe'
  sha1     'c67dbff41c3c2b4f61dcceed9bc05c55b5c683c4'

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
