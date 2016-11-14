set -x

mkdir -p ~/.zsh/completion/
mkdir -p ~/.zsh/cache

wget https://github.com/bazelbuild/bazel/raw/master/scripts/zsh_completion/_bazel ~/.zsh/completion/_bazel
