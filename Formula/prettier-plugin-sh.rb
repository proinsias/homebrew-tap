class PrettierPluginSh < Formula
  desc "Opinionated shell script formatter plugin for Prettier"
  homepage "https://github.com/un-ts/prettier/tree/master/packages/sh"
  url "https://registry.npmjs.org/prettier-plugin-sh/-/prettier-plugin-sh-0.20.2.tgz"
  sha256 "0be0660b1429698839d87c9c14db4f6e29138357ab0a153061110ba2056e84a5"
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
    system "node", "-e", "require(\"#{libexec}/lib/node_modules/prettier-plugin-sh/lib/index.cjs\")"
  end
end
