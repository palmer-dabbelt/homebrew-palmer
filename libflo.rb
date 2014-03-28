require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/libflo/archive/v0.0.6.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/libflo'
  sha1     '6823d29c3ce9944ce7bf5a512f9da147eece0c6a'

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
