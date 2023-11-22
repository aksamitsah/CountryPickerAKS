//
//  Models.swift
//
//
//  Created by Amit Shah on 16/11/23.
//

import UIKit

public enum CustomError: Error {
    
    case NotSelected
    case Custom(error: String)
    case Message(error: Error?)
    
    public var localizedDescription: String {
        switch self {
        case .NotSelected:
            return "No Any Country Selected"
        case .Custom(let error):
            return error
        case .Message(let error):
            return error?.localizedDescription ?? ""
        }
    }
}

public struct ThemeFont{
    
    var searchBar: UIFont
    var countryName: UIFont
    var countryCode: UIFont
    var countryFlag: UIFont
    
    public init(
        searchBar: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline),
        countryName: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline),
        countryCode: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline),
        countryFlag: UIFont = UIFont.systemFont(ofSize: 46, weight: .heavy)
    ) {
        self.searchBar = searchBar
        self.countryName = countryName
        self.countryCode = countryCode
        self.countryFlag = countryFlag
    }
}

public struct ThemeColor{
    
    var primary: UIColor
    var secondary: UIColor
    var textColor: UIColor
    
    public init(
        primary: UIColor? = nil,
        secondary: UIColor? = nil,
        textColor: UIColor? = nil
    ) {
        self.primary = primary ?? UIColor.primary
        self.textColor = textColor ?? UIColor.textColor
        self.secondary = secondary ?? UIColor.secondary
    }
}

public struct CountryList: Codable {
    
    public init(
        name: String,
        dial_code: String,
        emoji: String,
        code: String
    ) {
        self.name = name
        self.dial_code = dial_code
        self.emoji = emoji
        self.code = code
    }
    
    public let name: String
    public let dial_code: String
    public let emoji: String
    public let code: String
    
}

public struct ShowContent{
    
    var Flag: Bool = false
    var CountryName: Bool = false
    var CountryCode: Bool = false
    
    public init(
        Flag: Bool = false,
        CountryName: Bool = false,
        CountryCode: Bool = false
    ) {
        self.Flag = Flag
        self.CountryName = CountryName
        self.CountryCode = CountryCode
    }
    
    func checkValidation() -> Bool {
        return Flag || CountryName || CountryCode //false return at least 1 params required to present view
    }
}

public enum AlterExistingCountryList{
    case onTop([String])
    case onBottom([String])
    case onTopAfterLocal([String])
    case displayOnly([String])
    case removeOnly([String])
}

public struct CustomizeCountryList{
    
    let showLocalOnTop: Bool
    let addNew: [CountryList]
    let alterExisting: [AlterExistingCountryList]
    
    public init(
        showLocalOnTop: Bool = true,
        addNew: [CountryList] = [],
        alterExisting: [AlterExistingCountryList] = []
    ) {
        self.showLocalOnTop = showLocalOnTop
        self.addNew = addNew
        self.alterExisting = alterExisting
    }
    
}

public struct Config{
    
    var color: ThemeColor
    var font: ThemeFont
    var display: ShowContent
    var data: CustomizeCountryList

    public init(
        color: ThemeColor = ThemeColor(),
        font: ThemeFont = ThemeFont(),
        display: ShowContent = ShowContent(Flag: true, CountryName: true, CountryCode: true),
        data: CustomizeCountryList = CustomizeCountryList()
    ) {
        self.color = color
        self.font = font
        self.display = display
        self.data = data
    }
    
}
