class Firework < Formula
  desc "firework - kaboom, boom, boom"
  homepage "https://github.com/pehlicd/firework"
  url "https://github.com/pehlicd/firework.git",
      tag:      "v0.0.1",
      revision: "cf1df67fb44915490cdd4c74ae53f859a0a772d6"
  license "MIT"
  head "https://github.com/pehlicd/firework.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "-o", bin/"firework"
  end
end