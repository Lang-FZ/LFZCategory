Pod::Spec.new do |s|

  s.name         = "LFZCategory"
  s.version      = "0.0.2"
  s.summary      = "类扩展"

  s.description  = <<-DESC
                整理代码   类扩展
                   DESC

  s.homepage     = "https://github.com/Lang-FZ/LFZCategory"
  s.xcconfig  =  { "USER_HEADER_SEARCH_PATHS" => "${PODS_ROOT}/LFZCategory/LFZCategory/BPCategory" }
  s.license      = "MIT (LFZCategory)"
  s.author             = { "LangFZ" => "446003664@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/Lang-FZ/LFZCategory.git", :tag => "#{s.version}" }

  s.source_files  = "LFZCategory/BPCategory.h", "LFZCategory/BPCategory/*.{h,m}"
  s.requires_arc = true

end
