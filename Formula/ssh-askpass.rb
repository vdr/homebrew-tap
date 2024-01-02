class SshAskpass < Formula
  desc "Passphrase dialog for use with OpenSSH in macOS"
  homepage "https://github.com/vdr/ssh-askpass/"
  url "https://github.com/vdr/ssh-askpass/archive/v2.1.0.tar.gz"
  sha256 "8138eb0aa9b1abe91ca9587ebe7cc0e3e84721bc05f106b7c8ac8a038a3701f4"

  def install
    bin.install name.to_s
  end

  test do
    system "true"
  end
end
