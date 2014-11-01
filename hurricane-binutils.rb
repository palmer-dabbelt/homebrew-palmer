require 'formula'

class HurricaneBinutils < Formula
  url      'https://github.com/palmer-dabbelt/hurricane-binutils/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/hurricane-binutils'
  sha1     '43c0518b539ed29d1f85d81f43d29565d07466a1'

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
