require 'formula'

class Waf <Formula
  url 'http://waf.googlecode.com/files/waf-1.6.2'
  version '1.6.2'
  homepage 'http://code.google.com/p/waf/'

  depends_on 'python'

  def install
    bin.install 'waf-1.6.2' => 'waf'
  end
end
