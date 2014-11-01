require 'formula'

class HurricaneBinutils < Formula
  url      'https://github.com/palmer-dabbelt/hurricane-binutils/archive/v0.0.1.tar.gz'
  homepage 'https://github.com/palmer-dabbelt/hurricane-binutils'
  sha1     'd77e9db1bf828b923b6be55449a112483358ea83'

  depends_on 'pkg-config' => :build
  depends_on 'pconfigure' => :build

  def install
    cl = File.open("Configfile.local", "w")
    cl.puts("PREFIX = #{prefix}")
    cl.close

    system "pconfigure", "--verbose"
    system "make"
    system "make", "install"
  end
end
