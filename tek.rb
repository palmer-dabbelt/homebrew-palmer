require 'formula'

class Tek < Formula
  url      'https://github.com/palmer-dabbelt/tek/archive/v0.6.0.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/tek'
  sha1     '8e62d6f5e79dc2f6fa59f925c77721fac6e7d184'

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
