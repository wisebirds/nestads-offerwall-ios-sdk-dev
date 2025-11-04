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
      targets: ["NestAdsOfferwallSDKWrapper"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/1selfworld-labs/adchain-sdk-ios-release.git", .upToNextMinor(from: "1.0.47"))
  ],
  targets: [
    .binaryTarget(
      name: "NestAdsOfferwallSDK",
      url: "https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev/releases/download/0.1.1-dev/NestAdsOfferwallSDK.xcframework.zip",
      checksum: "b9df0004b8ebafd154e6b0d6a3af216b094b30311faeb0412bb333585dbaae5d"
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
