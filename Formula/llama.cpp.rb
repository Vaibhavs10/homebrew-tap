$version = "b2491"

class LlamaCpp < Formula
  desc "Inference of Meta's LLaMA model in pure C/C++"
  homepage "https://github.com/ggerganov/llama.cpp"
  version "v-#{$version}"
  # TODO: Find a way to do SHA computation on the fly.
  sha256 "bd085d7bb4616d0affe2dad69c5da069ec0334bdf5333bb52bf4ea678c4e0b89"
  license "MIT"

  depends_on :macos
  on_arm do
    arch = "arm64"
    url "https://github.com/ggerganov/llama.cpp/releases/download/#{$version}/llama-b1-bin-macos-#{arch}.zip"
  end
  on_intel do
    arch = "x64"
    url "https://github.com/ggerganov/llama.cpp/releases/download/#{$version}/llama-b1-bin-macos-#{arch}.zip"
  end

  def install
    # Install the necessary files to the Homebrew installation directory
    bin.install "bin/main" => "llama-cli"
    bin.install "bin/server" => "llama-server"
  end

  test do
    system "#{bin}/llama", "--version"
  end
end
