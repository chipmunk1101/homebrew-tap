cask "basalt" do
  version "2.2.5"
  sha256 "9e0fd413cf48424466bcf991b1bc76a8db8add2029d97d08f7addd5afb3d6fe5"

  url "https://basaltformac.com/Basalt-#{version}.pkg"
  name "Basalt"
  desc "PDF toolkit with verified redaction"
  homepage "https://basaltformac.com/"

  livecheck do
    url "https://basaltformac.com/pad.xml"
    regex(/Basalt[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
  end

  depends_on macos: :ventura

  pkg "Basalt-#{version}.pkg"

  uninstall quit:    "com.basalt.app",
            pkgutil: "com.basalt.app.pkg"

  zap trash: [
    "~/Library/Application Support/Basalt",
    "~/Library/Caches/com.basalt.app",
    "~/Library/HTTPStorages/com.basalt.app",
    "~/Library/Preferences/com.basalt.app.plist",
    "~/Library/Saved Application State/com.basalt.app.savedState",
  ]
end
