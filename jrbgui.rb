require 'formula'

class Jrbgui < Formula
  url      'https://github.com/palmer-dabbelt/jrbgui/archive/v0.1.6.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/jrbgui'
  sha1     '539f5c577dc5670dd5772adcc0e4a946169ce5a4'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'freeglut'
  depends_on 'portmidi'
  depends_on 'portaudio'
  depends_on 'homebrew/science/opencv'
  depends_on 'ilmbase'
  depends_on 'palmer-dabbelt/palmer/fakegl'

  def install
    system "pconfigure"
    system "make"
    system "make", "install"
  end
end
