require 'formula'

class Chisel < Formula
  url      'https://github.com/ucb-bar/chisel/archive/v2.1.tar.gz'
  homepage 'https://github.com/ucb-bar/chisel'
  sha1     ''

  depends_on 'pkg-config' => :build
  depends_on 'palmer-dabbelt/palmer/pconfigure' => :build
  depends_on 'scala'

  def install
    system "pconfigure"
    system "make"
    system "make", "install"
  end

  def patches
    [
     # Allow emulator.h to build with -Wall
     "https://github.com/palmer-dabbelt/chisel/commit/4e421a9a3e9b84c554899a553c37b65f4871ae68.diff",

     # Add Configfile for pconfigure
     "https://github.com/palmer-dabbelt/chisel/commit/7b58209ab6b98742042c4bfd7fb94bd9a757c7c0.diff"
    ]
  end
end
