// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ToastPresenter",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "ToastPresenter",
                 targets: ["ToastPresenter"])
    ],
    targets: [
        .target(name: "ToastPresenter",
                path: "ToastPresenter/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
