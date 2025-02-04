Pod::Spec.new do |spec|

  spec.name         = "CountryPickerAKS"
  spec.version      = "0.7.0"
  spec.summary      = "Easy-to-Use, Lightweight, and Pure Swift Country Picker"

  spec.description  = <<-DESC
                      Simplify country selection in your iOS app with CountryPickerAKS – a lightweight, easy-to-use, and purely Swift implemented library. Seamlessly integrate a customizable country picker, supporting dark and light modes, custom country additions, and automatic display of the current country. Upgrade your user experience effortlessly with this feature-rich Swift package manager and CocoaPods library.

                   DESC

  spec.homepage     = "https://github.com/aksamitsah/CountryPickerAKS"
  spec.screenshots  = "https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/d9df1638-a15a-41c2-9a8c-692302fb73f7","https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/290d8165-447c-478e-930b-6fd2d139e9b0","https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/848783df-17ad-415a-8f68-775ae5940bd2"

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
