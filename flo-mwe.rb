require 'formula'

class FloMwe < Formula
  url      'https://github.com/palmer-dabbelt/flo-mwe/archive/v0.0.4.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-mwe'
  sha1     '17f9ce6d853130d9ff9e2fef6fc9f7e9fd2a4419'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'libflo'
  depends_on 'llvm'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
