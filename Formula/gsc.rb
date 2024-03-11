class Gsc < Formula
  desc "gsc - GitLab Structured Cloner"
  homepage "https://github.com/pehlicd/gsc"
  url "https://github.com/pehlicd/gsc.git",
      tag:      "v0.0.0",
      revision: "0133a104447e1f03c6d94fcd9559bf6fa29182ba"
  license "MIT"
  head "https://github.com/pehlicd/gsc.git", branch: "main"

  depends_on "go" => :build

  def install
    project = "github.com/pehlicd/gsc"
    ldflags = %W[
      -s -w
      -X main.versionString=#{version}
      -X main.buildCommit=#{Utils.git_head}
      -X main.buildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/gsc/gsc.go"
  end

  test do
    assert_match version.to_s, "#{bin}/gsc -version"
  end
end
