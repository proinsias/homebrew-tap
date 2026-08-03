class YamlUpdateLastModifiedDate < Formula
  desc "Set the last modified date in YAML front matter of edited markdown files"
  homepage "https://github.com/proinsias/yaml-update-last-modified-date"
  url "https://github.com/proinsias/yaml-update-last-modified-date/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "a09ac7cbaac4265330e8a08aba8824f5b59cd064f1101c14335194e4c616580d"

  def install
    bin.install "yaml-update-last-modified-date"
  end
end
