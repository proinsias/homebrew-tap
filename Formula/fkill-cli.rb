require "language/node"

class FkillCli < Formula
  desc "Fabulously kill processes. Cross-platform"
  homepage "https://github.com/sindresorhus/fkill-cli#readme"
  url "https://registry.npmjs.org/fkill-cli/-/fkill-cli-9.0.0.tgz"
  sha256 "e92e858097abefc2c1438fb0aceeae86a4f7059034c28fb483efaa762ba45cb2"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    raise "Test not implemented."
  end
end
