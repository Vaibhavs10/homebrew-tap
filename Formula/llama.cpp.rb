class LlamaCpp < Formula
  desc "LLM inference in C/C++"
  homepage "https://github.com/ggerganov/llama.cpp"
  # pull from git tag to get submodules
  url "https://github.com/ggerganov/llama.cpp.git",
  tag:      "b2950",
  revision: "db10f01310beea8a1ef7798651b9d692fd1149d0"
  license "MIT"

  def install
    system "make", "LLAMA_FATAL_WARNINGS=ON", "LLAMA_METAL_EMBED_LIBRARY=ON", "LLAMA_CURL=ON"

    bin.install "./main" => "llama-cli"
    bin.install "./server" => "llama-server"
  end

  test do
    llama_cli_command = ["llama-cli","--hf-repo", "reach-vb/TinyLlama-1.1B-Chat-v0.5-Q2_K-GGUF", "-m", "tinyllama-1.1b-chat-v0.5.Q2_K.gguf"].join("")
    assert_includes shell_output(llama_cli_command), "ggml_metal_free: deallocating"
  end
end
