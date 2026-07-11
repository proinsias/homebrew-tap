class V8r < Formula
  desc "Command-line JSON, YAML and TOML validator that's on your wavelength"
  homepage "https://github.com/chris48s/v8r"
  url "https://registry.npmjs.org/v8r/-/v8r-6.1.0.tgz"
  sha256 "58b2a23c6c57bc4119e22837ce7f6e406ded2b2a9a01f71c4db05084adb2bf76"
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
    assert_match version.to_s, shell_output("#{bin}/v8r --version")
  end
end
