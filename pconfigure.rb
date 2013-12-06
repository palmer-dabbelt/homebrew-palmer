require 'formula'

class Pconfigure < Formula
  url      'https://github.com/palmer-dabbelt/pconfigure/archive/v0.6.0.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pconfigure/'
  sha1     '4bd95d75177fd423d078c06808cfff6b04a48900'

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
