require 'formula'

class ChiselBenchmarks < Formula
  url      'https://github.com/palmer-dabbelt/chisel-benchmarks/archive/v20140821.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/chisel-benchmarks'
  sha1     'e7ffb49cefa0032b6071bd93e3f12bcfaab67469'

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
