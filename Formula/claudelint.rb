class Claudelint < Formula
  desc "Linter and API for Claude Code projects"
  homepage "https://claudelint.com"
  url "https://registry.npmjs.org/claude-code-lint/-/claude-code-lint-0.10.0.tgz"
  sha256 "934d7ef29353752373d945a58dca26e8ded07435a059adf55a8aea0b6fb27156"
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
