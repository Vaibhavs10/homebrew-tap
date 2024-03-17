class LlamaCpp < Formula
 desc "Inference of Meta's LLaMA model in pure C/C++"
 homepage "https://github.com/ggerganov/llama.cpp"
 url "https://github.com/ggerganov/llama.cpp/archive/refs/heads/master.zip"
 version "0.1.0"
 sha256 "b3329120e0830e87d388a0d6784cf23a0e4cabaf96f664edae3afa415a641da0"
 license "MIT"

 depends_on "cmake" => :build
 depends_on "python@3.10"
 depends_on "git"
 depends_on "wget"

def install
    # Create a temporary directory for cloning
    temp_dir = Dir.mktmpdir
    system "git", "clone", "https://github.com/ggerganov/llama.cpp", temp_dir

    # Change to the temporary directory
    Dir.chdir(temp_dir) do
      # Build the project here
      system "make"

      # Install the necessary files to the Homebrew installation directory
      bin.install "main" => "llama"
    end

    # Clean up the temporary directory
    FileUtils.rm_rf(temp_dir)
 end

 test do
    system "#{bin}/llama", "--version"
 end
end

