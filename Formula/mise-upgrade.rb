class MiseUpgrade < Formula
  desc "Daily 6pm launchd service that runs `mise self-update` and `mise upgrade`"
  homepage "https://github.com/zehuac2/homebrew-tools"
  url "https://github.com/zehuac2/homebrew-tools.git", branch: "main"
  version "1.1.1"

  def install
    (bin/"mise-upgrade").write <<~SCRIPT
      #!/bin/bash
      # cron runs with a minimal PATH. Load mise's env first.
      # This sets PATH so mise can find its managed tools.
      eval "$($HOME/.local/bin/mise env -s bash)"
      $HOME/.local/bin/mise self-update -y
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
    assert_path_exists bin/"mise-upgrade"
  end
end
