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
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.0.0/novaos-cli-darwin-arm64"
      sha256 "7c4203621e3f31f8075c693584b2db639c080dadd77675a89682e3b07b5b7580"
    end
    on_intel do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.0.0/novaos-cli-darwin-x64"
      sha256 "d0e11e7cf1ba8be5e3c788fbdc3eee0f2898c6beaeccc8d4847f94d65d27f196"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.0.0/novaos-cli-linux-arm64"
      sha256 "a84d828360358dbda7d577e04c86874c2868d02b07f3e3f5d96c9f42a737f2d7"
    end
    on_intel do
      url "https://github.com/OrbitronAI-Repo/novaos-cli/releases/download/v2.0.0/novaos-cli-linux-x64"
      sha256 "a3f6e32b0ad4e818d2f0e8bafde9d458e70389c8d49f7f5d6fab77c9ec7524ed"
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
