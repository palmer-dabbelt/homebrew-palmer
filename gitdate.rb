require 'formula'

class Gitdate < Formula
  url      'https://github.com/palmer-dabbelt/gitdate/archive/v0.0.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/gitdate'
  sha1     'e0f422ad9f454aecb5c85d013e09c5aac2a7e7ff'

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
