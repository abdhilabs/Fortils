// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Fortils",
  platforms: [
    .iOS(.v16),
    .macOS(.v12)
  ],
  products: [
    .library(
      name: "Fortils",
      targets: ["Fortils"]),
  ],
  dependencies: [
    .package(url: "https://github.com/themomax/swift-docc-plugin", branch: "add-extended-types-flag"),
  ],
  targets: [
    .target(
      name: "Fortils",
      dependencies: []),
    .testTarget(
      name: "FortilsTests",
      dependencies: ["Fortils"]),
  ]
)
