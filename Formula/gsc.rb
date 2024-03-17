class Gsc < Formula
  desc "gsc - GitLab Structured Cloner"
  homepage "https://github.com/pehlicd/gsc"
  url "https://github.com/pehlicd/gsc.git",
      tag:      "v0.0.1",
      revision: "5273105ac2510c7f8a418a384b393bc9a9a5e905"
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
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/gsc.go"
  end

  test do
    assert_match version.to_s, "#{bin}/gsc -version"
  end
end
