class LineselectRs < Formula
  desc "Interactive line selector for the terminal"
  homepage "https://github.com/urbanogilson/lineselect"
  url "https://static.crates.io/crates/lineselect/lineselect-0.2.3.crate"
  sha256 "8554916ef81803cb625770c6ee84a42e68b1b9a97f0b758b915985238bc76e39"
  license "MIT"

  livecheck do
    url :stable
  end

  depends_on "rust" => :build
  conflicts_with "lineselect", because: "both install a `lineselect` binary"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lineselect --version")
  end
end
