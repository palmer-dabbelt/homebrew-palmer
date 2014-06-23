require 'formula'

class Vcd2step < Formula
  url      'https://github.com/palmer-dabbelt/vcd2step/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/vcd2step'
  sha1     '9090487f75f9df53cfeb3d67198f111a26f7795c'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'libflo'
  depends_on 'vcddiff'
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
