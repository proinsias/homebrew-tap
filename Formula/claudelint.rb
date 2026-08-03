class Claudelint < Formula
  desc "Linter and API for Claude Code projects"
  homepage "https://claudelint.com"
  url "https://registry.npmjs.org/claude-code-lint/-/claude-code-lint-0.7.1.tgz"
  sha256 "ba41d260cdbba3bec619bca7766cdaa9a952f0e5c41c10b7844308fa17ff93e1"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claudelint --version")
  end
end
