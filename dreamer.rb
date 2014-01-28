require 'formula'

class Dreamer < Formula
  url      'https://github.com/palmer-dabbelt/dreamer/archive/v0.0.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/dreamer'
  sha1     '6fc6e8bf5f2b2aed09c34e26c7b894d0b9f9b590'

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'palmer-dabbelt/palmer/chisel'
  depends_on 'palmer-dabbelt/palmer/jrbgui'
  depends_on 'portmidi'

  def install
    f = File.open("Configfile.local", "w")
    f.puts("PREFIX = #{prefix}")
    f.puts("LANGUAGES += c++")
    f.puts("LINKOPTS += -L#{prefix}/../../../lib")
    f.close

    system "pconfigure"
    system "make"
    system "make", "install"
  end

  def patches
    [
     "https://github.com/palmer-dabbelt/dreamer/commit/000dde32a16dd7ebf8966c72cc7cc928e48395da.diff",
     "https://github.com/palmer-dabbelt/dreamer/commit/ab817c0a7c8d634f49097720121cd9d2ae272193.diff",
     "https://github.com/palmer-dabbelt/dreamer/commit/ac9c0bd1d9089f246ab140b5f36d6619d7ebaf63.diff",
     "https://github.com/palmer-dabbelt/dreamer/commit/3d0dfda7a32431061177ce0f8737b11e00d0731b.diff",
    ]
  end
end
