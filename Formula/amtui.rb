class Amtui < Formula
  desc "Alertmanager TUI - Your favorite alertmanager client on your terminal."
  homepage "https://github.com/pehlicd/amtui"
  version "0.0.2"
  license "MIT"
  head "https://github.com/pehlicd/amtui.git", branch: "main"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/pehlicd/amtui/releases/download/v0.0.2/amtui_v0.0.2_darwin_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "ed429d344555afe36c68233fb33d560bc98017e0dc57a6f369b449a58c36ba6d"
        
        def install
          bin.install "amtui"
        end
    end
    if Hardware::CPU.intel?
        url "https://github.com/pehlicd/amtui/releases/download/v0.0.2/amtui_v0.0.2_darwin_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "a5a0d00df38f777625574e1bc2c3aac954e5b1bdc2c76cbe688bb359213e1a11"
        
        def install
          bin.install "amtui"
        end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pehlicd/amtui/releases/download/v0.0.2/amtui_v0.0.2_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "1131fbfaae9a1564903d151da97a8074fd076c0b18a70858249561533228df02"

      def install
        bin.install "amtui"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/pehlicd/amtui/releases/download/v0.0.2/amtui_v0.0.2_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "3d28bde1bb630dd8b7d0a57ee0083e0492c3ef268b86eddddd5dd93fb24c7395"

      def install
        bin.install "amtui"
      end
    end
  end
end