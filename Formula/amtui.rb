class Amtui < Formula
  desc "Alertmanager TUI - Your Terminal Companion for Alertmanager"
  homepage "https://github.com/pehlicd/amtui"
  url "https://github.com/pehlicd/amtui.git",
      tag:      "v0.1.5",
      revision: "6c96784aebff40e0c737e8190c001d317577133a"
  license "MIT"
  head "https://github.com/pehlicd/amtui.git", branch: "main"

  depends_on "go" => :build

  def install
    project = "github.com/pehlicd/amtui"
    ldflags = %W[
      -s -w
      -X #{project}/pkg.versionString=#{version}
      -X #{project}/pkg.buildCommit=#{Utils.git_head}
      -X #{project}/pkg.buildDate=#{time.iso8601}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, "#{bin}/amtui --version"
  end
end
