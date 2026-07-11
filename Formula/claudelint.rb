require "language/node"

class ClaudeCodeLint < Formula
  desc "Comprehensive linter and programmatic API for Claude Code projects - validates CLAUDE.md files, skills, settings, hooks, MCP servers, plugins, and more"
  homepage "https://claudelint.com"
  url "https://registry.npmjs.org/claude-code-lint/-/claude-code-lint-0.5.0.tgz"
  sha256 "53ae5667fdb53800a58990963ac1340452e7420b9c747aa8d74bc4e09f49a7b4"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claudelint --version")
  end
end
