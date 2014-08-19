require 'formula'

class Tek < Formula
  url      'https://github.com/palmer-dabbelt/tek/archive/v0.3.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/tek'
  sha1     '41c32b2a2fdcf8bc75c446af1a91d5c588aed9d7'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
