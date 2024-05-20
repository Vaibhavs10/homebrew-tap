class LlamaCpp < Formula
desc "LLM inference in C/C++"
homepage "https://github.com/ggerganov/llama.cpp"
# pull from git tag to get submodules
url "https://github.com/ggerganov/llama.cpp.git",
tag:      "b2568",
revision: "be55134a535f7218c53f39211755b1c7550851b2"
license "MIT"

def install
system "make", "DLLAMA_FATAL_WARNINGS=ON", "DLLAMA_METAL_EMBED_LIBRARY=ON", "DLLAMA_CURL=ON"

bin.install "./main" => "llama-cli"
bin.install "./server" => "llama-server"
end
test do
    llama_cli_command = ["llama-cli"].join(" ")
    assert_includes shell_output(llama_cli_command), "Log start"
end
end
