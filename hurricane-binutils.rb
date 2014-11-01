require 'formula'

class HurricaneBinutils < Formula
  url      'https://github.com/palmer-dabbelt/hurricane-binutils/archive/v0.0.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/hurricane-binutils'
  sha1     '8fed31e04f28068ef6146ec82d3ab0e828f74138'

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
