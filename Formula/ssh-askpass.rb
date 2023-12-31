class SshAskpass < Formula
  desc "Passphrase dialog for use with OpenSSH in macOS"
  homepage "https://github.com/vdr/ssh-askpass/"
  url "https://github.com/vdr/ssh-askpass/archive/v2.0.0.tar.gz"
  sha256 "d994d2dc594766b186a30e247f1d0402b89bbaac86f95585bd2dfdf9afcc61d5"

  def install
    bin.install name.to_s
  end

  test do
    system "true"
  end
end
