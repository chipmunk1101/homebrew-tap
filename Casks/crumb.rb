cask "crumb" do
  arch arm: "apple-silicon", intel: "intel"

  version "3.0.0"
  sha256 arm:   "2abeeab87ea3f42848b1f9005260a0d5983741c4e109a0525696e700dbd4c1e9",
         intel: "3605387645c3553adac969063d859768ed68bee4aeec43b6282f82e5ad172b68"

  url "https://cleanwithcrumb.com/downloads/Crumb-#{version}-#{arch}.pkg"
  name "Crumb"
  desc "Storage cleaner that explains what is safe to delete"
  homepage "https://cleanwithcrumb.com/"

  livecheck do
    url :homepage
    regex(/Crumb[._-]v?(\d+(?:\.\d+)+)[._-]apple[._-]silicon\.pkg/i)
  end

  depends_on macos: :monterey

  pkg "Crumb-#{version}-#{arch}.pkg"

  uninstall quit:    "com.caretopia.crumb",
            pkgutil: "com.caretopia.crumb"

  zap trash: [
    "~/Library/Application Support/com.caretopia.crumb",
    "~/Library/Caches/com.caretopia.crumb",
    "~/Library/Caches/com.caretopia.crumb.preview",
    "~/Library/Preferences/com.caretopia.crumb.plist",
    "~/Library/WebKit/com.caretopia.crumb",
  ]
end
