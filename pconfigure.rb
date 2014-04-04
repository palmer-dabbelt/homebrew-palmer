require 'formula'

class Pconfigure < Formula
  url      'https://github.com/palmer-dabbelt/pconfigure/archive/v0.7.4.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pconfigure/'
  sha1     '9e7f0518185d6f13eae9a965b9708dc5696ac63e'

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
