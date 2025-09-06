# typed: false
# frozen_string_literal: true

class IntelligentTerminal < Formula
  include Language::Python::Virtualenv

  desc "AI-assisted terminal with natural-language commands, suggestions, and error explainers"
  homepage "https://intelligent-terminal.com"
  url "https://github.com/1DigitalPartner/intelligent-terminal/releases/download/v0.1.0/intelligent_terminal-0.1.0-py3-none-any.whl"
  sha256 "de52449f2fb0bfb07cdd0d44a7d31161cb11430efafdeac56d3bbff87c836892"
  license "MIT"

  depends_on "python@3.11"

  def install
    venv = virtualenv_create(libexec, "python3.11")

    # On Tier-2 macOS, venv may be created without pip; bootstrap it offline.
    system libexec/"bin/python", "-m", "ensurepip", "--upgrade"

    # Homebrew caches the download with a hash-prefixed filename that pip rejects.
    # Copy it to a clean, valid wheel filename (use the URL's basename).
    wheel_name = File.basename(stable.url) # => intelligent_terminal-0.1.0-py3-none-any.whl
    wheel_path = buildpath/wheel_name
    cp cached_download, wheel_path

    # Install the wheel from the venv without touching the network.
    system libexec/"bin/python", "-m", "pip", "install", "--no-index", wheel_path

    # Expose the console entry point
    bin.install_symlink libexec/"bin/intelligent-terminal"
  end

  test do
    output = shell_output("#{bin}/intelligent-terminal -h 2>&1 || true")
    assert_match "AI Terminal", output
  end
end
