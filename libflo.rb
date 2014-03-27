require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/libflo/archive/v0.0.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/libflo'
  sha1     '398617d7de04e971ac9eafed9e16a72acd0798b4'

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
