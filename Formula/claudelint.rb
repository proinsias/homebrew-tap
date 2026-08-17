class Claudelint < Formula
  desc "Linter and API for Claude Code projects"
  homepage "https://claudelint.com"
  url "https://registry.npmjs.org/claude-code-lint/-/claude-code-lint-0.8.0.tgz"
  sha256 "60420bc5573c3169480bd629ff900287be85b6f2298ba30ee217720ccdbd4d23"
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
