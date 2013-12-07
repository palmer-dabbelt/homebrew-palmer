require 'formula'

class Jrbgui < Formula
  url      'https://github.com/palmer-dabbelt/jrbgui/archive/v0.1.4.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/jrbgui'
  sha1     '9b6f323720c1d7a1e70ca4cc473e5c75960ecbd2'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'freeglut'
  depends_on 'portmidi'
  depends_on 'portaudio'
  depends_on 'homebrew/science/opencv'
  depends_on 'ilmbase'
  depends_on 'palmer-dabbelt/palmer/fakegl'

  def install
    f = File.open("Configfile.local", "w")
    f.puts("PREFIX = #{prefix}")
    f.puts("LANGUAGES += c++")
    f.puts("LINKOPTS += -L#{prefix}/../../../lib")
    f.puts("LINKOPTS += -framework OpenGL")
    f.puts("LINKOPTS += -framework GLUT")
    f.puts("LINKOPTS += -framework Carbon")
    f.puts("LINKOPTS += -lportmidi")
    f.puts("LINKOPTS += -lportaudio")
    f.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
