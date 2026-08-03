class YamlUpdateLastModifiedDate < Formula
  desc "Set the last modified date in YAML front matter of edited markdown files"
  homepage "https://github.com/proinsias/yaml-update-last-modified-date"
  url "https://github.com/proinsias/yaml-update-last-modified-date/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "69c69c0b5ab4ca08230a6617473b9fed1af986bf7e5ba1a998b37135f6fe05af"

  def install
    bin.install "yaml-update-last-modified-date"
  end
end
