require 'formula'

class Vcddiff < Formula
  url      'https://github.com/palmer-dabbelt/vcddiff/archive/v0.0.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/vcddiff'
  sha1     'a96b76c7549a8089d8fb05d1acfd309631ebf480'

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
