require 'formula'

class Pconfigure < Formula
  url      'https://github.com/palmer-dabbelt/pconfigure/archive/v0.5.4.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pconfigure/'
  sha1     '5eb5a405b80994c8c2750566560c07c23bf4a2d7'

  def install
    system "sed", "-i", "bak", "s/soname/install_name/g", "Configfiles/main"
    system "bash", "-ex", "./bootstrap.sh", "--prefix", "#{prefix}"
    system "make", "install"
  end
end
