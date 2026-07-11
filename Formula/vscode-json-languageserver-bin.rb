require "language/node"

class VscodeJsonLanguageserverBin < Formula
  desc "JSON language server"
  homepage "https://github.com/vscode-langservers/vscode-json-languageserver-bin#readme"
  url "https://registry.npmjs.org/vscode-json-languageserver-bin/-/vscode-json-languageserver-bin-1.0.1.tgz"
  sha256 "ae2680e7a465f64a145e76c44c9a48e64376425fa8150997fc528a2d5be685c6"
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
