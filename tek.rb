require 'formula'

class Tek < Formula
  url      'https://github.com/palmer-dabbelt/tek/archive/v0.8.0.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/tek'
  sha1     '5c6fb82d99515a4a788351d1c4fb65d1467a67d3'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build
  depends_on 'inkscape'

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
