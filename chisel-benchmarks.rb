require 'formula'

class ChiselBenchmarks < Formula
  url      'https://github.com/palmer-dabbelt/chisel-benchmarks/archive/v20140709.0.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/chisel-benchmarks'
  sha1     '356772b48b6470cc44a02b1cca5d6b79aa72c0d5'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
