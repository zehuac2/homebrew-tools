class MiseUpgrade < Formula
  desc "Daily 6pm launchd service that runs `mise upgrade`"
  homepage "https://github.com/Zehua-Chen/homebrew-tools"
  url "https://github.com/Zehua-Chen/homebrew-tools.git", branch: "master"
  version "1.0.0"

  def install
    (bin/"mise-upgrade").write <<~SCRIPT
      #!/bin/bash
      $HOME/.local/bin/mise upgrade
    SCRIPT
    chmod 0755, bin/"mise-upgrade"
  end

  service do
    run [opt_bin/"mise-upgrade"]
    run_type :cron
    cron "0 18 * * *"
    log_path var/"log/mise-upgrade.log"
    error_log_path var/"log/mise-upgrade.log"
  end

  test do
    assert_predicate bin/"mise-upgrade", :exist?
  end
end
