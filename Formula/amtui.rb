class Amtui < Formula
  desc "Alertmanager TUI - Your Terminal Companion for Alertmanager"
  homepage "https://github.com/pehlicd/amtui"
  url "https://github.com/pehlicd/amtui.git",
      tag:      "v0.0.2",
      revision: "7e8698e978d93ae82976a898cea9f0db8a73f244"
  license "MIT"
  head "https://github.com/pehlicd/amtui.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end
end