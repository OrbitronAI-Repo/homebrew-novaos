class NovaosCli < Formula
  desc "Command-line tool for building, running and publishing NovaOS agents"
  homepage "https://github.com/OrbitronAI-Repo/novaos-cli"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.1.0/novaos-cli-darwin-arm64"
      sha256 "df12d3a06ba60216d1623282fbb2cd0dcd19f268da077c67665d20278f2aacf8"
    end
    on_intel do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.1.0/novaos-cli-darwin-x64"
      sha256 "1296c283959ec15e25ef78f3d120271ca8d30cc4c7b978bbc17e72aef604f0fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.1.0/novaos-cli-linux-arm64"
      sha256 "278c83e01fa8dce5c5a244f1d8bc99f630868a7abfe8018686b03f83743deb0f"
    end
    on_intel do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.1.0/novaos-cli-linux-x64"
      sha256 "b8de9186d0df0a621bdf0969d1db0a6bcc26854eb7bae0b1b03aff2735fffa47"
    end
  end

  def install
    # Each platform downloads a single standalone binary named after its
    # release asset; install it under the command's own name.
    downloaded = Dir.glob("*").reject { |f| File.directory?(f) }
    odie "expected exactly one downloaded artifact, got: #{downloaded}" if downloaded.length != 1
    bin.install downloaded.first => "novaos-cli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/novaos-cli -V").strip
    system bin/"novaos-cli", "--help"
    # A fresh home directory: listing environments must work with no saved
    # configuration or credentials.
    ENV["HOME"] = testpath
    system bin/"novaos-cli", "env", "list"
  end
end
