class YamlUpdateLastModifiedDate < Formula
  desc "Set the last modified date in YAML front matter of edited markdown files"
  homepage "https://github.com/proinsias/yaml-update-last-modified-date"
  url "https://github.com/proinsias/yaml-update-last-modified-date/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "a09ac7cbaac4265330e8a08aba8824f5b59cd064f1101c14335194e4c616580d"

  def install
    bin.install "yaml-update-last-modified-date"
  end

  test do
    system "git", "init"
    system "git", "config", "user.email", "test@example.com"
    system "git", "config", "user.name", "Test"

    (testpath/"test.md").write <<~EOS
      ---
      last_modified_at: 2020-01-01 00:00:00
      ---
      # Hello
    EOS
    system "git", "add", "test.md"

    output = shell_output(bin/"yaml-update-last-modified-date")
    assert_match "Updated modified date for test.md.", output
    refute_match "last_modified_at: 2020-01-01 00:00:00", (testpath/"test.md").read
  end
end
