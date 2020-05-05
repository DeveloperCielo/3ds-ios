Pod::Spec.new do |spec|

  spec.name         = "Braspag3Ds"
  spec.version      = "1.0.5"
  spec.summary      = "Biblioteca de validação de cartões de crédito"

  spec.description  = <<-DESC
  Biblioteca Cielo/Braspag de validação de cartões de crédito utilizando o método 3DS.
                   DESC

  spec.homepage     = "https://github.com/DeveloperCielo/3ds-ios"

  spec.license      = "MIT"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  spec.author             = { "Jeferson F. Nazario" => "jefnazario@gmail.com" }
  # Or just: spec.author    = "Jeferson F. Nazario"
  # spec.authors            = { "Jeferson F. Nazario" => "jefnazario@gmail.com" }
  spec.social_media_url   = "https://twitter.com/jefnazario"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/DeveloperCielo/3ds-ios.git", :tag => "1.0.3" }
  spec.swift_version = "5.0"


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "Braspag3dsSdk/Braspag3dsSdk/**/*.{h,m,swift,framework}"
  spec.resources = ['Braspag3dsSdk/CardinalMobile.framework']
  spec.preserve_paths = 'Braspag3dsSdk/CardinalMobile.framework'
  spec.vendored_frameworks = 'Braspag3dsSdk/CardinalMobile.framework'
  spec.exclude_files = "Example3ds/*.*"
end
