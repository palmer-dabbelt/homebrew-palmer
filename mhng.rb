require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/mhng/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/mhng'
  sha1     '8279f81805388d5aebcb51cb3ee819304e09c894'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'gpgme'
  depends_on 'lynx'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
