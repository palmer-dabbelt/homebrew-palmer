require 'formula'

class Libocn < Formula
  url      'https://github.com/palmer-dabbelt/libocn/archive/v0.0.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/libocn'
  sha1     'd92779f441bf8c946cd1d61858358b179bea8fbf'

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
