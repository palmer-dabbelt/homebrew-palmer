require 'formula'

class Tek < Formula
  url      'https://github.com/palmer-dabbelt/tek/archive/v0.9.0.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/tek'
  sha1     '58720a1c28813f53abf266ada47fedb94540f2fc'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'librsvg'
  depends_on 'imagemagick'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
