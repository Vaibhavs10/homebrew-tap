class LlamaCpp < Formula
  desc "LLM inference in C/C++"
  homepage "https://github.com/ggerganov/llama.cpp"
  # pull from git tag to get submodules
  url "https://github.com/ggerganov/llama.cpp/archive/refs/tags/b2780.tar.gz",
      tag:      "b2963",
      revision: "95fb0aefab568348da159efdd370e064d1b35f97"
  license "MIT"

  depends_on "curl"

  def install
    system "make", "LLAMA_FATAL_WARNINGS=ON", "LLAMA_METAL_EMBED_LIBRARY=ON", "LLAMA_CURL=ON"

    bin.install "./main" => "llama-cli"
    bin.install "./server" => "llama-server"
  end

  test do
    llama_cli_command = ["llama-cli",
                         "--hf-repo",
                         "reach-vb/TinyLlama-1.1B-Chat-v0.5-Q2_K-GGUF",
                         "-m",
                         "tinyllama-1.1b-chat-v0.5.Q2_K.gguf",
                         "-n",
                         "400"].join(" ")
    assert_includes shell_output(llama_cli_command), "ggml_metal_free: deallocating"
  end
end
