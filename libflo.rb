require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/libflo/archive/v0.0.16.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/libflo'
  sha1     'a8dddd25e5ca882a6186e9eedf8179e8c71cd395'

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
