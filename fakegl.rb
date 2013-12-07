require 'formula'

class Fakegl < Formula
  url      'https://github.com/palmer-dabbelt/fakegl/archive/v0.0.2.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/fakegl'
  sha1     'f05f2037df45274d58fa5577b6ad0ff4da3d9e0d'

  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build

  def install
    f = File.open("Configfile.local", "w")
    f.puts("PREFIX = #{prefix}")
    f.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
