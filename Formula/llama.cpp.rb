$version = "b2496"

class LlamaCpp < Formula
  desc "Inference of Meta's LLaMA model in pure C/C++"
  homepage "https://github.com/ggerganov/llama.cpp"
  version "v-#{$version}"
  # TODO: Find a way to do SHA computation on the fly.
  sha256 "18b73455ba566ca0b6a30877266b1b4f0f55ddff9c319a97c48acd94fe33662f"
  license "MIT"

  depends_on :macos
  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/ggerganov/llama.cpp/releases/download/#{$version}/llama-b1-bin-macos-x64.zip"
    else
      url "https://github.com/ggerganov/llama.cpp/releases/download/#{$version}/llama-b1-bin-macos-arm64.zip"
    end
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
