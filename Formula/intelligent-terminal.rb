# typed: false
# frozen_string_literal: true

class IntelligentTerminal < Formula
  include Language::Python::Virtualenv

  desc "AI-assisted terminal with natural-language commands, suggestions, and error explainers"
  homepage "https://intelligent-terminal.com"
  url "https://github.com/1DigitalPartner/intelligent-terminal/releases/download/v0.1.0/intelligent_terminal-0.1.0.tar.gz"
  sha256 "b2bb34bdadf9564da82ac3c92731eaa53dc6812b2558abd7df793c1c40b5e232"
  license "MIT"

  depends_on "python@3.11"

  # Optional: populate resources for dependencies (prompt_toolkit, rich, pyyaml)
  # Run locally:
  #   brew update-python-resources Formula/intelligent-terminal.rb

  def install
    virtualenv_install_with_resources
  end

  test do
    # Smoke test: help output should mention 'AI Terminal'
    output = shell_output("#{bin}/intelligent-terminal -h 2>&1 || true")
    assert_match "AI Terminal", output
  end
end
