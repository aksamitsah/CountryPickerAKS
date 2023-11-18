Pod::Spec.new do |spec|

  spec.name         = "CountryPickerAKS"
  spec.version      = "0.2.0"
  spec.summary      = "Easy-to-Use, Lightweight, and Pure Swift Country Picker"

  spec.description  = <<-DESC
                      Simplify country selection in your iOS app with CountryPickerAKS – a lightweight, easy-to-use, and purely Swift implemented library. Seamlessly integrate a customizable country picker, supporting dark and light modes, custom country additions, and automatic display of the current country. Upgrade your user experience effortlessly with this feature-rich Swift package manager and CocoaPods library.

                   DESC

  spec.homepage     = "https://github.com/aksamitsah/CountryPickerAKS"
  spec.screenshots  = "https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/bf4ee5ed-3a5c-43fc-a5b8-e811a3ddc29c", "https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/c39dfeb1-fc1d-4150-a4a7-07b63c6fb0c6"

  spec.license      = "MIT"

  spec.author             = { "Amit Sah" => "aksamitsah@gmail.com" }
  spec.social_media_url   = "https://github.com/aksamitsah"

  spec.platform     = :ios
  spec.platform     = :ios, "12.0"

  spec.source       = { :git => "https://github.com/aksamitsah/CountryPickerAKS.git", :tag => "#{spec.version}" }

  spec.source_files  = "Sources/CountryPickerAKS/**/*.{swift}"

  spec.resource_bundles = {
    'CountryPickerAKS_Resources' => ['Sources/CountryPickerAKS/Resources/*']
  }

  spec.swift_versions = "5.0"

end
