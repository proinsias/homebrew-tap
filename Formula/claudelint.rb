class Claudelint < Formula
  desc "Linter and API for Claude Code projects"
  homepage "https://claudelint.com"
  url "https://registry.npmjs.org/claude-code-lint/-/claude-code-lint-0.9.0.tgz"
  sha256 "80d829ab7a69c6b87b5308edefbada47e145c6a053aae80052c547f5076548af"
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
