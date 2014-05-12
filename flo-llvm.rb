require 'formula'

class FloLlvm < Formula
  url      'https://github.com/palmer-dabbelt/flo-llvm/archive/v0.0.9.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-llvm'
  sha1     '82bcebe65e862425d72a440aa8135a9b8811853f'

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
