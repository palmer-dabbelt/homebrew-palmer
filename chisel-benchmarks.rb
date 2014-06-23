require 'formula'

class ChiselBenchmarks < Formula
  url      'https://github.com/palmer-dabbelt/chisel-benchmarks/archive/v20140623.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/chisel-benchmarks'
  sha1     '33f86ffa70bc04e72ef4890743b2c3f03c22cb74'

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
