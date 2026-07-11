require "language/node"

class VscodeHtmlLanguageserverBin < Formula
  desc "HTML language server extracted from VSCode, published as npm binary"
  homepage "https://github.com/vscode-langservers/vscode-html-languageserver-bin#readme"
  url "https://registry.npmjs.org/vscode-html-languageserver-bin/-/vscode-html-languageserver-bin-1.4.0.tgz"
  sha256 "262a770d25ce82d48548b0a423c8114ead6a30d327d09ad24b3950c1386e99ef"
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
