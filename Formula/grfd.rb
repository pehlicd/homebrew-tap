class Grfd < Formula
  desc "GRFD - Get Ready for Daily"
  homepage "https://github.com/pehlicd/grfd"
  url "https://github.com/pehlicd/grfd.git",
      tag:      "v0.0.0.",
      revision: "019b149cd7926dc9ebda818cba569f978d316120"
  license "Apache-2.0"
  head "https://github.com/pehlicd/grfd.git", branch: "main"

  depends_on "go" => :build

  def install
    project = "github.com/pehlicd/grfd"
    ldflags = %W[
      -s -w
      -X #{project}/pkg.versionString=#{version}
      -X #{project}/pkg.buildCommit=#{Utils.git_head}
      -X #{project}/pkg.buildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, "#{bin}/grfd -version"
  end
end
