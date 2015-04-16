Pod::Spec.new do |s|
  s.name         = "IOSViewShims"
  s.version      = "0.0.1"
  s.summary      = "Abstracts some methods for showing alerts, confirmations, and menus."

  s.description  = <<-DESC
	Abstracts some methods for showing alerts, confirmations, and menus."
                  DESC

  s.dependency 'UIKitCategoryAdditions'
  s.homepage = "https://github.com/ncooper123/"
  s.license = { :type => 'BSD' }
  s.author = { "Nathan" => "ncooper@uno.edu" }
  s.platform = :ios
  s.requires_arc = true
  s.source = { :git => "https://github.com/ncooper123/ios-view-shims.git", :branch => "master", :tag => '0.0.1' }
  s.resources = []
  s.source_files = "*.{h,m}"

end
