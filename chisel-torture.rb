require 'formula'

class ChiselTorture < Formula
  url      'https://github.com/palmer-dabbelt/chisel-torture/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/chisel-torture'
  sha1     '1aa33e73f897072b58c48186790320547e3f94f6'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'gmp'
  depends_on 'libflo'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
