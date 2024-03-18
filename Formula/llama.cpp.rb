$version = "b2453"

 class LlamaCpp < Formula
   desc "Inference of Meta's LLaMA model in pure C/C++"
   homepage "https://github.com/Narsil/llama.cpp"

   depends_on :macos
   on_arm do
     arch = "arm64"
     url "https://github.com/Narsil/llama.cpp/releases/download/prebuild_metal-b2465-2f34f73/llama-prebuild_metal-b1-2f34f73-bin-macos-#{arch}.zip"
   end
   on_intel do
     arch = "x64"
     url "https://github.com/Narsil/llama.cpp/releases/download/prebuild_metal-b2465-2f34f73/llama-prebuild_metal-b1-2f34f73-bin-macos-#{arch}.zip"
   end
   version "prebuild_metal-b2461-5f45c05"
   sha256 ""
   license "MIT"

  def install
     # Install the necessary files to the Homebrew installation directory
     bin.install "bin/main" => "llama-cli"
     bin.install "bin/server" => "llama-server"
  end

  test do
     system "#{bin}/llama", "--version"
  end
 end
