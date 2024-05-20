# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class LlamaCpp < Formula
desc "LLM inference in C/C++"
homepage "https://github.com/ggerganov/llama.cpp"
# pull from git tag to get submodules
url "https://github.com/ggerganov/llama.cpp.git",
tag:      "b2568",
revision: "be55134a535f7218c53f39211755b1c7550851b2"
sha256 "96017b0693d09f5870155e7215c38764fe152f5cd976c79ddd5046f6c5d33753"
license "MIT"

def install
system "make", "-DLLAMA_FATAL_WARNINGS=ON", "-DLLAMA_METAL_EMBED_LIBRARY=ON", "-DLLAMA_CURL=ON"

bin.install "{#bin}/main" => "llama-cli"
bin.install "{#bin}/server" => "llama-server"
end
test do
# `test do` will create, run in and delete a temporary directory.
#
# This test will fail and we won't accept that! For Homebrew/homebrew-core
# this will need to be a test that verifies the functionality of the
# software. Run the test with `brew test llama.cpp`. Options passed
# to `brew install` such as `--HEAD` also need to be provided to `brew test`.
#
# The installed folder is not in the path, so use the entire path to any
# executables being tested: `system "#{bin}/program", "do", "something"`.
system "false"
end
end
