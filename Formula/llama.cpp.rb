$version = "b2453"

class LlamaCpp < Formula
 desc "Inference of Meta's LLaMA model in pure C/C++"
 homepage "https://github.com/ggerganov/llama.cpp"
 url "https://github.com/ggerganov/llama.cpp/archive/refs/tags/#$version.zip"
 version "#$version"
 sha256 "139136ad43ff05dab5b26d0c3b41fe5ee2b872b01f6ec642fe5ea6a8ccabca67"
 license "MIT"

def install
    # Build the project here
    ENV["LLAMA_METAL_EMBED_LIBRARY"] = "1"
    system "make"

    # Install the necessary files to the Homebrew installation directory
    bin.install "main" => "llama"
 end

 test do
    system "#{bin}/llama", "--version"
 end
end
