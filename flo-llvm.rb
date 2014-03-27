require 'formula'

class Libflo < Formula
  url      'https://github.com/palmer-dabbelt/flo-llvm/archive/v0.0.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-llvm'
  sha1     '0bf5cc7ca853659f3cb800173d8573f9b554266f'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'llvm'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
