class Tuiodo < Formula
  desc "A modern terminal task manager with extensive customization"
  homepage "https://github.com/spmfte/tuiodo"
  url "https://github.com/spmfte/tuiodo/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "b4f63fb6b01f8140fb323a214b897327cc85ec0b92ba0f88e6fa4907cd398a7b"
  license "MIT"
  head "https://github.com/spmfte/tuiodo.git", branch: "master"

  # Additional metadata for the formula
  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    # Set build time, version and commit hash
    if build.head?
      # For HEAD installs, get the actual git commit
      git_revision = Utils.git_short_head
      git_version = "head"
    else
      # For release installs, use the version
      git_revision = stable.version.to_s[0..6]
      git_version = version
    end

    ldflags = %W[
      -s -w
      -X main.Version=#{git_version}
      -X main.BuildTime=#{Time.now.iso8601}
      -X main.GitCommit=#{git_revision}
    ].join(" ")

    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  def caveats
    <<~EOS
      TUIODO has been installed!
      
      Run `tuiodo` to start managing your tasks.
      For help and options, use `tuiodo --help`
      
      New in v1.1.3:
      - Automatic git repository detection for TODO.md files
      - When in a git repository, automatically uses TODO.md at the repository root
      - Falls back to home directory TODO.md when not in a git repository
      
      New in v1.1.2:
      - Customizable category colors via configuration
      - Default sort by priority for better task organization
      - Categories for completed tasks now appear with dimmed colors
      - Completed tasks always appear at the bottom of lists
      - Priority indicators hidden for completed tasks
    EOS
  end

  test do
    system "#{bin}/tuiodo", "--version"
  end
end 