//
//  CountryManager.swift
//
//
//  Created by Amit Shah on 04/02/2025.
//

import Foundation

public class CountryManager {
    
    public static let shared: CountryManager = CountryManager()
    private var countries: [CountryList] = []
    
    private init() {
         countries = CountryModelList().countryList()
    }
    
    public func country(withCode code: String) -> CountryList? {
        return countries.first(where: { $0.code.caseInsensitiveCompare(code) == .orderedSame })
    }
    
    public func country(withName name: String) -> CountryList? {
        return countries.first(where: { $0.name.caseInsensitiveCompare(name) == .orderedSame })
    }
    
    public func country(withDialCode dialCode: String) -> CountryList? {
        let formattedDialCode = dialCode.trimmingCharacters(in: .whitespacesAndNewlines)
        let finalDialCode = formattedDialCode.hasPrefix("+") ? formattedDialCode : "+" + formattedDialCode
        return countries.first(where: { $0.dial_code == finalDialCode })
    }
    
    public func country(withEmoji emoji: String) -> CountryList? {
        return countries.first(where: { $0.emoji == emoji })
    }
}