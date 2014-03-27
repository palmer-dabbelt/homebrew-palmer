require 'formula'

class Pconfigure < Formula
  url      'https://github.com/palmer-dabbelt/pconfigure/archive/v0.7.3.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pconfigure/'
  sha1     '65722495ccfec79c2b2d0cd6e95d5dccbea9d859'

  depends_on 'pkg-config' => :build
  depends_on 'talloc'
  depends_on 'xz'

  def install
    system "sed", "-i", "bak", "s/soname/install_name/g", "Configfiles/main"
    system "sed", "-i", "bak", "s/1024/10240/g", "src/pconfigure/main.c"
    system "bash", "-ex", "./bootstrap.sh", "--prefix", "#{prefix}"
    system "make", "install"
  end
end
