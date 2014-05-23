require 'formula'

class Vcddiff < Formula
  url      'https://github.com/palmer-dabbelt/vcddiff/archive/v0.0.5.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/vcddiff'
  sha1     'b2fb645c92d522bbcd16e30b43e9b4451ecad1e5'

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
