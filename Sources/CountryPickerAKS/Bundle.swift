//
//  File.swift
//  
//
//  Created by Amit Shah on 18/11/23.
//

import class Foundation.Bundle

private class BundleFinder {}

extension Foundation.Bundle {
    
    static var _module: Bundle = {

        #if SWIFT_PACKAGE
        return .module
        #else
        let bundleName = "CountryPickerAKS_Resources"

        let candidates = [
            Bundle.main.resourceURL,
            Bundle(for: BundleFinder.self).resourceURL,
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }
        
        return Bundle(for: CountryPicker.self)
        #endif
    }()
}
