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
      url: "https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev/releases/download/0.1.0-dev/NestAdsOfferwallSDK.xcframework.zip",
      checksum: "3739b3c845c535361468507bc453c49af3660ad21961b6fd996b1214ccebf23b"
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
