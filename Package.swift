// swift-tools-version:5.9
import PackageDescription
let package = Package(
  name: "NestAdsOfferwallSDK",
  platforms: [
    .iOS(.v14)
  ],
  products: [
    .library(
      name: "NestAdsOfferwallSDK",
      targets: ["NestAdsOfferwallSDK"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/1selfworld-labs/adchain-sdk-ios-release.git", from: "1.0.45")
  ],
  targets: [
    .binaryTarget(
      name: "NestAdsOfferwallSDKBinary",
      url: "https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev/releases/download/0.1.0-beta-dev/NestAdsOfferwallSDK.xcframework.zip",
      checksum: "bb0924a11d714932bdf6293ee557b339004bdf4c04ad4499eda99cabdde73bdb"
    ),
    .target(
      name: "NestAdsOfferwallSDK",
      dependencies: [
        "NestAdsOfferwallSDKBinary",
        .product(name: "AdchainSDK", package: "adchain-sdk-ios-release")
      ],
      path: "Sources/Wrapper"
    )
  ]
)
