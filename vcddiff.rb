require 'formula'

class Vcddiff < Formula
  url      'https://github.com/palmer-dabbelt/vcddiff/archive/v0.0.4.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/vcddiff'
  sha1     '0fc980b5838bfcd116be8956b3aaa204685dae2c'

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
