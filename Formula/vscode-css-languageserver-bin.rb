require "language/node"

class VscodeCssLanguageserverBin < Formula
  desc "CSS language server extracted from VSCode, published as npm binary"
  homepage "https://github.com/vscode-langservers/vscode-css-languageserver-bin#readme"
  url "https://registry.npmjs.org/vscode-css-languageserver-bin/-/vscode-css-languageserver-bin-1.4.0.tgz"
  sha256 "daa006f74a6baa265e743811bf224003048144c805bc3a9dd3f8175d4815bced"
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
