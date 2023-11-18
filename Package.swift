// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "CountryPickerAKS",
    products: [
        .library(
            name: "CountryPickerAKS",
            targets: ["CountryPickerAKS"]),
    ],
    targets: [
        .target(
            name: "CountryPickerAKS",
            resources: [
                .process("Resources")
            ]
        ),
    ]
)
