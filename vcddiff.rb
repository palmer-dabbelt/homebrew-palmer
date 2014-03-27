require 'formula'

class Vcddiff < Formula
  url      'https://github.com/palmer-dabbelt/vcddiff/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/vcddiff'
  sha1     '519342bd76400adcba1855dc5b731179a67f0e39'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
