Pod::Spec.new do |s|
  s.name = "lummox-nscollection-extensions"
  s.version = "1.0"
  s.summary = "Functionality built on top of NSCollections."
  s.homepage = "https://github.com/mbusheikin/lummox-nscollection-extensions"
  s.license = 'MIT'
  s.author = "Michael Busheikin"
  s.source = { :git => "https://github.com/mbusheikin/lummox-nscollection-extensions.git", :tag => "v1.0" }
  s.platform = :ios
  s.source_files = 'LummoxNSCollectionExtensions/LummoxNSCollectionExtensions'
end
