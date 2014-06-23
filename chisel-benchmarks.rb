require 'formula'

class ChiselBenchmarks < Formula
  url      'https://github.com/palmer-dabbelt/chisel-benchmarks/archive/v20140623.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/chisel-benchmarks'
  sha1     '7d9a373754e3542500fc953f73d6b51083cbb73f'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'sbt' => :build

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
