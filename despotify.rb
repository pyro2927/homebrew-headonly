require 'formula'

class Despotify < Formula
  head 'http://svn.code.sf.net/p/despotify/code/src'
  homepage 'http://despotify.se/'

  depends_on 'pkg-config' => :build
  depends_on 'libao'
  depends_on 'libvorbis'
  depends_on 'mpg123'

  def install
    system "cp Makefile.local.mk.dist Makefile.local.mk"
    system "make Makefile.local.mk"
    inreplace "Makefile.local.mk", "# INSTALL_PREFIX = /usr", "INSTALL_PREFIX = #{prefix}"
    system "make"
    system "make install"
  end
end
