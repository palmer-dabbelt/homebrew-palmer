require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/libflo/archive/v0.0.15.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/libflo'
  sha1     'c8908fa2ac90aa9e5c1f96fe5d54c5daaa6cacc9'

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
