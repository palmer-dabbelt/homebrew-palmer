require 'formula'

class Pconfigure < Formula
  url      'https://github.com/palmer-dabbelt/pconfigure/archive/v0.9.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pconfigure/'
  sha1     '1471f4184ba550be64617386406ffdb5ba941b99'

  depends_on 'pkg-config' => :build
  depends_on 'talloc'
  depends_on 'xz'

  def install
    system "sed", "-i", "bak", "s/soname/install_name/g", "Configfiles/main"
    system "sed", "-i", "bak", "s/1024/10240/g", "src/pconfigure/main.c"
    system "sed", "-i", "bak", "s/make ||/make all all_install ||/", "bootstrap.sh"
    system "bash", "-ex", "./bootstrap.sh", "--prefix", "#{prefix}"
    system "make", "install"
  end
end
