require 'formula'

class Tek < Formula
  url      'https://github.com/palmer-dabbelt/tek/archive/v0.7.0.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/tek'
  sha1     '5423a77c531bba292e70e3f0fb9d4353231c1f64'

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
