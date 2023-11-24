<div align='center'>

<a href="#"><img src="https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/d9df1638-a15a-41c2-9a8c-692302fb73f7.png"></a><br><br>

 <a href="#"><img src="https://img.shields.io/badge/platform-iOS-blue.svg" alt="Platform: iOS"/></a>
 <a href="#"><img src="https://img.shields.io/badge/iOS-11%2B-green.svg" alt="iOS 11+"/></a>
 <a href="#"><img src="https://img.shields.io/badge/Swift-5.0%2B-orange.svg" alt="Swift 5.0+"/></a>
 <a href="#"><img src="https://img.shields.io/badge/Xcode-14.x%2B-green.svg" alt="XCode 14.x+"/></a>
 <a href="#"><img src="https://img.shields.io/badge/Release-v0.6.0-blue.svg"/></a>
 <a href="https://github.com/aksamitsah/CountryPickerAKS/tree/main#%EF%B8%8F-countrypickeraks---docs"><img src="https://img.shields.io/badge/Doc-Latest-green.svg"/></a>
 <a href="https://raw.githubusercontent.com/aksamitsah/CountryPickerAKS/main/LICENSE"><img src="https://img.shields.io/badge/License-MIT-red.svg"></a><br>
 
 <a href="https://swiftpackageindex.com/aksamitsah/CountryPickerAKS"><img src="https://img.shields.io/badge/Swift package manager-compatible-darkgreen.svg" alt="spm compatible"/></a>
 <a href="https://cocoapods.org/pods/CountryPickerAKS"><img src="https://img.shields.io/badge/Cocopod-compatible-darkgreen.svg" alt="Cocopod compatible"/></a><br><br>

</div>

<p>Streamline country selection with ease. Customize themes, add countries, optimize lists – all tailored to your app. A simple, powerful choice for an enhanced user experience. 🌐✨</p>

## ⛳️ CountryPickerAKS

## 😳 Features

- [x] Appearance available for both Light and Dark modes
- [x] Customizable Font to match your App's style for Country, Country Code, and Search
- [x] Enable or Disable Local Country on Top option
- [x] Customizable theme based on your App's primary, secondary, and text colors
- [x] Add Custom Country if desired
- [x] Alter Country List according to your preference (Top, Bottom, or After Local Country)
- [x] Optimized Search based on Country Name (e.g., INDIA), Dial Code (e.g., 91), or Country Code (e.g., IN)
- [x] Avaiable for Cocoa Pods & Swift package manager
- [x] Best practices followed
 

Give it a ⭐️ if it simplifies your app development!

## 📱 Screenshots

<div align='center'>
  <img src="https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/290d8165-447c-478e-930b-6fd2d139e9b0.png" width="300">
  <img src="https://github.com/aksamitsah/CountryPickerAKS/assets/42860041/848783df-17ad-415a-8f68-775ae5940bd2.png" width="300">
  
  <h4>LIGHT & DARK MODE</h4>
</div>

## 🤖 Installation

#### Swift Package Manager

- File > Swift Packages > Add Package Dependency
- Add `https://github.com/aksamitsah/CountryPickerAKS.git`
- Select `Up to Next Major` for latest update

#### CocoaPods

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '12.0'
use_frameworks!

target 'MyApp' do
  pod 'CountryPickerAKS'
end
```

## ⛳️ CountryPickerAKS - Docs

### Defualt

```swift
import CountryPickerAKS

CountryPicker.show(from: self) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```

### A More Advanced Example

With the powerful options, you can accomplish complex tasks with CountryPickerAKS in a simple way. For example, the code below:

- All the parameters have default values. If you want to override them, just pass the params `config` updated based on your needs.

1. Alter Display Elements
- Case: If at least one parameter is required to display, give an error.

```swift
CountryPicker.show(from: self, config: Config(
    display: ShowContent(Flag: true, CountryName: true)
)) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```

2. Update Theme
  - Recommendation: If you use dark mode, then pass both appearances.

```swift
CountryPicker.show(from: self, config: Config(
    color: ThemeColor(
        primary: .systemGray6,
        secondary: .systemBackground,
        textColor: .systemBlue)
)) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```


3. Update Font

```swift
CountryPicker.show(from: self, config: Config(
         font: ThemeFont(
                searchBar: UIFont(name: "Lemonada-Medium", size: 16) ?? UIFont(),
                countryName: UIFont(name: "Lemonada-Regular", size: 16) ?? UIFont(),
                countryCode: UIFont(name: "Lemonada-Light", size: 16) ?? UIFont(),
                countryFlag: UIFont(name: "Lemonada-Bold", size: 22) ?? UIFont())
)) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```

4. Show/Hide Local Country

```swift
CountryPicker.show(from: self, config: Config(
    data: CustomizeCountryList(showLocalOnTop: false)
)) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```

5. Add New Country / Alter Position / Display & Remove Only

```swift
CountryPicker.show(from: self, config: Config(
    data: CustomizeCountryList(
        addNew: [
            CountryList(name: "New Country", dial_code: "+12", emoji: "🫡", code: "NCA"),
            CountryList(name: "New Country B", dial_code: "+13", emoji: "😵‍💫", code: "NCB")
            ],
        alterExisting: [
            .onTop(["NCA", "NCB"]),
            .onTopAfterLocal(["NP"]),
            .onBottom(["US"])
            ]
    )
)) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```

- Use Display Only `.displayOnly([code])` Country: Used to display only a list of countries.
- Use Remove Only `.removeOnly([code])` Country: Used to remove a particular country.

```swift
CountryPicker.show(from: self, config: Config(
    data: CustomizeCountryList(
        addNew: [
            CountryList(name: "New Country", dial_code: "+12", emoji: "🫡", code: "NCA"),
            CountryList(name: "New Country B", dial_code: "+13", emoji: "😵‍💫", code: "NCB")
            ],
        alterExisting: [
            .onTop(["NCA", "NCB"]),
            .onTopAfterLocal(["NP"]),
            .onBottom(["US"]),
            .displayOnly(["NCA","NCB"]),
            .removeOnly(["NCB"])
            ]
    )
)) { result in
   switch result {
       case .success(let data):
       debugPrint(data)
       case .failure(let err):
       debugPrint(err.localizedDescription)
   }
}
```


## 😳 Requirements

- iOS 11.0+ with support for the latest release, iOS 17
- Latest Xcode 14.x with Swift
- Swift v5.0+
  
## 🪪 License

[MIT © 2023](https://raw.githubusercontent.com/aksamitsah/CountryPickerAKS/main/LICENSE)

## 🔗 Links

<div align='center'>
  <a href="https://www.amit-sah.com.np/"><img src="https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white"/></a>
  <a href="https://www.linkedin.com/in/aksamitsah/"><img src="https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white"/></a>
  <a href="#"><img src="https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white"/></a>
  
</div>




