require 'formula'

class FloLlvm < Formula
  url      'https://github.com/palmer-dabbelt/flo-llvm/archive/v0.0.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/flo-llvm'
  sha1     'ecafb425c67823d5100f68b62ef8e79badd43292'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'palmer-dabbelt/palmer/libflo'
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
