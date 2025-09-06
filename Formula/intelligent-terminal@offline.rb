
cd ~/Downloads/homebrew-intelligent-terminal-tap

cat > Formula/intelligent-terminal@offline.rb <<'RUBY'
# typed: false
# frozen_string_literal: true

class IntelligentTerminalATOffline < Formula
  include Language::Python::Virtualenv

  desc "AI-assisted terminal with natural-language commands, suggestions, and error explainers (offline vendored)"
  homepage "https://intelligent-terminal.com"
  url "https://github.com/1DigitalPartner/intelligent-terminal/releases/download/v0.1.1/intelligent_terminal-0.1.1.tar.gz"
  sha256 "b6c92d29579e90fe891a496ff80394290dea6d2005cb120593a3930e6afb4734"
  license "MIT"

  # Pin the Python we target in the venv
  depends_on "python@3.11"

  # NOTE:
  # This 'offline' formula is meant to vendor all dependencies, so installs do not hit PyPI.
  # After creating/updating this formula, run:
  #   brew update-python-resources Formula/intelligent-terminal@offline.rb
  # which will populate the 'resource' blocks automatically from the project's dependencies.

  def install
    virtualenv_install_with_resources
  end

  test do
    output = shell_output("#{bin}/intelligent-terminal -h 2>&1 || true")
    assert_match "AI Terminal", output
  end
end
