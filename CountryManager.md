
# 🗺️ **CountryManager**

The `CountryManager` class provides a convenient way to manage and retrieve country data based on different parameters such as country code, country name, dial code, and country emoji. It is a singleton class, ensuring that there is only one instance of the country data throughout the app.

### 📦 **Properties**

- **`shared`**: A static instance of `CountryManager`, providing global access to the country data.
- **`countries`**: A private array that holds the list of countries, populated by the `CountryModelList().countryList()` method.

### 🛠️ **Methods**

#### `public func country(withCode code: String) -> CountryList?`
Fetches the country matching the provided country code.

- **Parameters**: 
  - `code`: A `String` representing the country code (e.g., "US", "IN").
- **Returns**: 
  - A `CountryList?` object, which is the country matching the provided code, or `nil` if no match is found.

##### Example:
```swift
if let country = CountryManager.shared.country(withCode: "IN") {
    print(country.name) // Prints "India"
}
```

---

#### `public func country(withName name: String) -> CountryList?`
Fetches the country matching the provided country name.

- **Parameters**: 
  - `name`: A `String` representing the country name (e.g., "India", "United States").
- **Returns**: 
  - A `CountryList?` object, which is the country matching the provided name, or `nil` if no match is found.

##### Example:
```swift
if let country = CountryManager.shared.country(withName: "India") {
    print(country.code) // Prints "IN"
}
```

---

#### `public func country(withDialCode dialCode: String) -> CountryList?`
Fetches the country matching the provided dial code.

- **Parameters**: 
  - `dialCode`: A `String` representing the dialing code (e.g., "+91", "+1").
- **Returns**: 
  - A `CountryList?` object, which is the country matching the provided dial code, or `nil` if no match is found.

##### Example:
```swift
if let country = CountryManager.shared.country(withDialCode: "+91") {
    print(country.name) // Prints "India"
}
```

---

#### `public func country(withEmoji emoji: String) -> CountryList?`
Fetches the country matching the provided country emoji.

- **Parameters**: 
  - `emoji`: A `String` representing the emoji of the country (e.g., "🇮🇳", "🇺🇸").
- **Returns**: 
  - A `CountryList?` object, which is the country matching the provided emoji, or `nil` if no match is found.

##### Example:
```swift
if let country = CountryManager.shared.country(withEmoji: "🇮🇳") {
    print(country.code) // Prints "IN"
}
```

---

### 🚀 **Usage**

To use the `CountryManager` class, you can call any of the provided methods through the shared instance:

```swift
// Get country by code
let countryByCode = CountryManager.shared.country(withCode: "US")

// Get country by name
let countryByName = CountryManager.shared.country(withName: "United States")

// Get country by dial code
let countryByDialCode = CountryManager.shared.country(withDialCode: "+1")

// Get country by emoji
let countryByEmoji = CountryManager.shared.country(withEmoji: "🇺🇸")
```

---

### ⚡ **Optimized for Simplicity**

The `CountryManager` class is designed to make it simple and quick to fetch country data by various criteria. It eliminates the need to manage or maintain the country data manually, and all operations are done using efficient lookups.

---

### 🔧 **Requirements**

- iOS 11.0+ with Swift v5.0+
- Xcode 14.x+

---

### 📄 **License**

This library is available under the MIT License.
