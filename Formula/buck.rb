require 'formula'

class Buck < Formula
  homepage 'https://github.com/denizt/buck/'
  url 'https://github.com/denizt/buck/archive/v0.1.0.tar.gz'
  sha1 '68b9c320c8da05bd18c4e867ca9394c4034f26b0'

  def install
    system "ant"
    libexec.install Dir['bin', 'build', 'lib', 'src', 'third-party']
    inreplace libexec + "bin/buck_common", "BUCK_CURRENT_VERSION=\"N/A\"", "BUCK_CURRENT_VERSION=\"#{version}\""
    bin.install_symlink libexec + 'bin/buck'
  end
end
