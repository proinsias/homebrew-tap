require "language/node"

class PrettierPluginSh < Formula
  desc "Opinionated shell script formatter plugin for Prettier"
  homepage "https://github.com/un-ts/prettier/tree/master/packages/sh"
  url "https://registry.npmjs.org/prettier-plugin-sh/-/prettier-plugin-sh-0.19.0.tgz"
  sha256 "e34e85390d5c67d8f4e54b2d41f2ac7dfec8df21a7e3765891af563899154217"
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
