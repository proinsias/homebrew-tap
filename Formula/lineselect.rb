class Lineselect < Formula
  desc "Shell utility to interactively select lines from stdin"
  homepage "https://github.com/chfritz/lineselect"
  url "https://registry.npmjs.org/lineselect/-/lineselect-0.2.1.tgz"
  sha256 "f496344ca1f7ed42e9e9b21eb42b2307d6a719bbbf7b1f6da8dfdfb0522fa6f5"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "node"
  conflicts_with "lineselect-rs", because: "both install a `lineselect` binary"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/lineselect 2>&1", 1)
    assert_match "requires stdin to be a readable pipe", output
  end
end
