class Amtui < Formula
  desc "Alertmanager TUI - Your favorite alertmanager client on your terminal."
  homepage "https://github.com/pehlicd/amtui"
  version "0.0.1"
  license "MIT"
  head "https://github.com/pehlicd/amtui.git", :branch => "master"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/pehlicd/amtui/releases/download/v0.0.1/amtui_0.0.1_darwin_arm64.tar.gz", using: CurlDownloadStrategy
        sha256 "b88674364950c116d93946ac8c1372fb56eefdb41d2287dd9adf6e10e8f4bc6e"
        
        def install
          bin.install "amtui"
        end
    end
    if Hardware::CPU.intel?
        url "https://github.com/pehlicd/amtui/releases/download/v0.0.1/amtui_0.0.1_darwin_amd64.tar.gz", using: CurlDownloadStrategy
        sha256 "04cd0cbbdc9de598a621faf858aa3046b41ec40c10c179973eb379dec4824bcb"
        
        def install
          bin.install "amtui"
        end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/pehlicd/amtui/releases/download/v0.0.1/amtui_0.0.1_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "6798af16ed7603ac27327996906fe32092ac418cfc03da7a261bde9d203eb936"

      def install
        bin.install "amtui"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/pehlicd/amtui/releases/download/v0.0.1/amtui_0.0.1_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "c1a23f6e5771c96c0a04143b7b63b51d8a408f40d4b5bcdd33b9732216e77e5d"

      def install
        bin.install "amtui"
      end
    end
  end
end