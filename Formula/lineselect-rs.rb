class LineselectRs < Formula
  desc "Interactive line selector for the terminal"
  homepage "https://github.com/urbanogilson/lineselect"
  url "https://static.crates.io/crates/lineselect/lineselect-0.2.0.crate"
  sha256 "f6b4cb9e6a6a6b39859281c166f31177599314ebc71daa16dcf9a80153950818"
  license "MIT"

  depends_on "rust" => :build
  conflicts_with "lineselect", because: "both install a `lineselect` binary"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/lineselect", "--help"
  end
end
