class Lineselect < Formula
  desc "Shell utility to interactively select lines from stdin"
  homepage "https://github.com/chfritz/lineselect"
  url "https://registry.npmjs.org/lineselect/-/lineselect-0.1.6.tgz"
  sha256 "e1bba422137332e7d0369757ed2e17a3201827546263891a868096f67f7ffff0"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end
