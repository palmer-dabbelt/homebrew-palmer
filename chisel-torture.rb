require 'formula'

class ChiselTorture < Formula
  url      'https://github.com/palmer-dabbelt/chisel-torture/archive/v0.0.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/chisel-torture'
  sha1     '5f0ac3a94bc69e831fbc0e36ce948f34267710e2'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'gmp'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
