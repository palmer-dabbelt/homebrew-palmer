require 'formula'

class HurricaneBinutils < Formula
  url      'https://github.com/palmer-dabbelt/hurricane-binutils/archive/v0.0.4.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/hurricane-binutils'
  sha1     '0b595fa6ce432f0d0187944d1620265dbdd049e2'

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
