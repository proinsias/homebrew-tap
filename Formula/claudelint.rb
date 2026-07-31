class Claudelint < Formula
  desc "Linter and API for Claude Code projects"
  homepage "https://claudelint.com"
  url "https://registry.npmjs.org/claude-code-lint/-/claude-code-lint-0.7.0.tgz"
  sha256 "0ce6d45098e7919295a561470900ca2a283a099f3fe912c0704b4e4ce95d8018"
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
