class BrewUpgrade < Formula
  desc "Daily 6pm launchd service that runs `brew upgrade`"
  homepage "https://github.com/zehuac2/homebrew-tools"
  url "https://github.com/zehuac2/homebrew-tools.git", branch: "master"
  version "1.0.0"

  def install
    (bin/"brew-upgrade").write <<~SCRIPT
      #!/bin/bash
      #{HOMEBREW_PREFIX}/bin/brew upgrade --formula
    SCRIPT
    chmod 0755, bin/"brew-upgrade"
  end

  service do
    run [opt_bin/"brew-upgrade"]
    run_type :cron
    cron "0 18 * * *"
    log_path var/"log/brew-upgrade.log"
    error_log_path var/"log/brew-upgrade.log"
  end

  test do
    assert_predicate bin/"brew-upgrade", :exist?
  end
end
