Pod::Spec.new do |s|
  s.name         = "NACViewShims"
  s.version      = "0.0.7"
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
  s.source = { :git => "https://github.com/ncooper123/NACViewShims.git", :branch => "master", :tag => '0.0.7' }
  s.source_files = "*.{h,m}"

end
