require 'formula'

class Pchisel < Formula
  url      'https://github.com/palmer-dabbelt/pchisel/archive/v2.0.4.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pchisel'
  sha1     'db1b6ec04e52dad636cd0a77322ba0c8dd83e70a'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'scala'

  def install
    f = File.open("Configfile.local", "w")
    f.puts("PREFIX = #{prefix}")
    f.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
