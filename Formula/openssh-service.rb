class OpensshService < Formula
  desc "A OSX Service for brew OpenSSH"
  homepage "https://github.com/vdr/openssh-service/"
  url "https://github.com/vdr/openssh-service/archive/v1.1.0.tar.gz"
  sha256 "c13c5e86a59896aba7a74731e6d34362abf4bd3fa8bf9d93cf30a4ad7cd802e9"
  
  depends_on "openssh"
  depends_on "vdr/tap/ssh-askpass"
  
  service do
    run [Formula["openssh"].opt_bin/"/opt/homebrew/bin/ssh-agent", "-D", "-a", "/tmp/ssh-agent.socket"]
    environment_variables "SSH_ASKPASS"=>Formula["vdr/tap/ssh-askpass"].opt_bin/"ssh-askpass", "SSH_ASKPASS_REQUIRE"=>"force"
    keep_alive true
  end

  def install
    bin.install name.to_s
  end
  
  test do
    system "true"
  end
end
