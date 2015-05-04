require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/libflo/archive/v0.0.21.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/libflo'
  sha1     'd70e0ecf0a1e6154c0cca92828ecd078b0e88ed4'

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
