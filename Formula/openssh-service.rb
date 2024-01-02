class OpensshService < Formula
  desc "A MacOS Launchd Service for Brew OpenSSH"
  homepage "https://github.com/vdr/openssh-service/"
  url "https://github.com/vdr/openssh-service/archive/v1.6.0.tar.gz"
  sha256 "658e10c5eec54302b1d06b73f6385759b9f63907979e914bbbeebad277be75ec"
  
  depends_on "openssh"
  depends_on "vdr/tap/ssh-askpass"
  
  def install
    bin.install name.to_s
    inreplace "openssh-service.conf", "/tmp/openssh-service.socket", "#{HOMEBREW_PREFIX}/var/run/openssh-service.sock"
    (etc/"ssh_config.d").install "openssh-service.conf"
  end
  
  service do
    run [opt_bin/"openssh-service", "launchd"]
    environment_variables PATH: std_service_path_env, OPENSSH_SERVICE_SOCK: var/"run/openssh-service.sock"
    log_path var/"log/openssh-service.log"
    error_log_path var/"log/openssh-service.log"
  end
  
  test do
    system "true"
  end

  def caveats
    <<~EOS
      [Recommended] Add the following line to your .ssh/config
        Include #{etc}/ssh_config.d/openssh-service.conf
      Alternatively, run the following command in your .bashrc or .zshrc
        eval $(#{name} session)
    EOS
  end
end
