// swift-tools-version:5.9
import PackageDescription
let package = Package(
  name: "NestAdsOfferwallSDK",
  platforms: [
    .iOS(.v15)
  ],
  products: [
    .library(
      name: "NestAdsOfferwallSDK",
      targets: ["NestAdsOfferwallSDKWrapper"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/1selfworld-labs/adchain-sdk-ios-release.git", .upToNextMinor(from: "1.0.54"))
  ],
  targets: [
    .binaryTarget(
      name: "NestAdsOfferwallSDK",
      url: "https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev/releases/download/1.0.1-dev/NestAdsOfferwallSDK.xcframework.zip",
      checksum: "817d3063cf9f30b21d7d0f7419af7dea2d30f5378046eb8d80d4be02bc30a1e3"
    ),
    .target(
      name: "NestAdsOfferwallSDKWrapper",
      dependencies: [
        "NestAdsOfferwallSDK",
        .product(name: "AdchainSDK", package: "adchain-sdk-ios-release")
      ],
      path: "Sources/Wrapper"
    )
  ]
)
