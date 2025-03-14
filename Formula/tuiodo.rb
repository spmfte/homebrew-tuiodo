class Tuiodo < Formula
  desc "A modern terminal task manager with extensive customization"
  homepage "https://github.com/spmfte/tuiodo"
  url "https://github.com/spmfte/tuiodo/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "80017436093845c867fbdba7cbfa8b9e282a1ac34f26baf8bc4f09b355ebbf39"
  version "1.1.0"
  license "MIT"

  head "https://github.com/spmfte/tuiodo.git", branch: "master"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X main.Version=#{version}
      -X main.BuildTime=#{Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")}
      -X main.GitCommit=#{Utils.git_short_head}
    ].join(" ")

    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    system "#{bin}/tuiodo", "--version"
  end
end 