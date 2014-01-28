require 'formula'

class Pconfigure < Formula
  url      'https://github.com/palmer-dabbelt/pconfigure/archive/v0.7.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/pconfigure/'
  sha1     'c1131a00e209611a4761fdfe213c94e729f394a1'

  depends_on 'pkg-config' => :build
  depends_on 'talloc'
  depends_on 'xz'

  def install
    system "sed", "-i", "bak", "s/soname/install_name/g", "Configfiles/main"
    system "sed", "-i", "bak", "s/1024/10240/g", "src/pconfigure/main.c"
    system "bash", "-ex", "./bootstrap.sh", "--prefix", "#{prefix}"
    system "make", "install"
  end

  def patches
    [
     # Use gzip instead of xz for pscalald
     "https://github.com/palmer-dabbelt/pconfigure/commit/5786df9fc4c066487fe5596aa300bf12578844f5.diff",
     # Use pkg-config for Chisel pscalald
     "https://github.com/palmer-dabbelt/pconfigure/commit/34166ff545168c4c809105990911635f4fab7b87.diff",
     # Use pkg-config for Chisel C++
     "https://github.com/palmer-dabbelt/pconfigure/commit/48a27100ffd7cda35b92945459d56ed633fce1f3.diff",
     "https://github.com/palmer-dabbelt/pconfigure/commit/0443be3dcbbc804bd76ecdfbf24fe4132ac15d94.diff"
    ]
  end
end
