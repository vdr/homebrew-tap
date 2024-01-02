class OpensshService < Formula
  desc "A MacOS Launchd Service for Brew OpenSSH"
  homepage "https://github.com/vdr/openssh-service/"
  url "https://github.com/vdr/openssh-service/archive/v1.2.3.tar.gz"
  sha256 "8f48c40d9fcc5822ee12a893df74dc145cd5836ead4e7b4146c54f07d8f56909"
  
  depends_on "openssh"
  depends_on "vdr/tap/ssh-askpass"
  
  def install
    bin.install name.to_s
  end
  
  service do
    run [opt_bin/"openssh-service", "launchd"]
    environment_variables PATH: std_service_path_env
    log_path var/"log/openssh-service.log"
    error_log_path var/"log/openssh-service.log"
  end
  
  test do
    system "true"
  end

  def caveats
    <<~EOS
      Run the following command in your .bashrc or .zshrc
        eval $(#{name} session)
    EOS
  end
end
