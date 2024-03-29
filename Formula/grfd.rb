class Grfd < Formula
  desc "GRFD - Get Ready for Daily"
  homepage "https://github.com/pehlicd/grfd"
  url "https://github.com/pehlicd/grfd.git",
      tag:      "v0.0.0",
      revision: "3738c9b44a50fe6e7b8137293b4a6d633371a108"
  license "Apache-2.0"
  head "https://github.com/pehlicd/grfd.git", branch: "main"

  depends_on "go" => :build

  def install
    project = "github.com/pehlicd/grfd"
    ldflags = %W[
      -s -w
      -X main.versionString=#{version}
      -X main.buildCommit=#{Utils.git_head}
      -X main.buildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/grfd/grfd.go"
  end

  test do
    assert_match version.to_s, "#{bin}/grfd -version"
  end
end
