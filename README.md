# NestAdsOfferwallSDK

![Version](https://img.shields.io/badge/version-0.1.0-beta-dev-blue.svg)
![Platform](https://img.shields.io/badge/platform-iOS%2014.0%2B-lightgrey.svg)
![Swift](https://img.shields.io/badge/Swift-5.9%2B-orange.svg)

NestAds Offerwall SDK provides offerwall monetization features powered by AdChain SDK. It can be used standalone or integrated with NestAdsSDK.

## Requirements

- iOS 14.0+
- Swift 5.9+
- Xcode 15.0+
- **NestAdsSDK v2.9.0 or higher** (Peer Dependency - required for integrated mode)

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev", .exact("0.1.0-beta-dev"))
]
```

Or add via Xcode:
1. File → Add Package Dependencies
2. Enter: `https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev`
3. Select version: `0.1.0-beta-dev`

### Integration with NestAdsSDK (Recommended)

**⚠️ Important**: NestAdsSDK is a **peer dependency**. You must add both packages to use the integrated mode.

If you're using **NestAdsSDK v2.9.0+**, add both packages:

```swift
dependencies: [
    .package(url: "https://github.com/wisebirds/nestads-ios-sdk", from: "2.9.0"),
    .package(url: "https://github.com/wisebirds/nestads-offerwall-ios-sdk-dev", .exact("0.1.0-beta-dev"))
]
```

**Benefits of integrated mode:**
- ✅ No additional import needed - just use `NestAds.Offerwall`
- ✅ Automatic error reporting to NestAdsSDK's GlobalExceptionHandler
- ✅ Unified SDK initialization
- ✅ Dynamic loading (Offerwall SDK loaded at runtime)

## Quick Start

### Option 1: With NestAdsSDK (Recommended)

If you're using NestAdsSDK, initialize Offerwall through `OfferwallConfig`:

```swift
import NestAdsSDK

// 1. Create Offerwall configuration
let offerwallConfig = OfferwallConfig(
    application: UIApplication.shared,
    appKey: "YOUR_ADCHAIN_APP_KEY",
    appSecret: "YOUR_ADCHAIN_APP_SECRET",
    timeoutMillis: 30000  // Optional, 30 seconds
)

// 2. Initialize NestAds with Offerwall
NestAds.sharedInstance().start(offerwallConfig: offerwallConfig)

// 3. Login user
NestAds.Offerwall.login(
    userId: "user123",
    gender: 1,  // 0=Unknown, 1=Male, 2=Female
    birthYear: 1990
)

// 4. Display Offerwall
NestAds.Offerwall.openOfferwall(
    from: self,
    placementCode: "PLACEMENT_CODE",
    showNavigationBar: false,
    useNativeNavigationBar: false
)
```

### Option 2: Standalone Usage

Use `NestAdsOfferwall` directly without NestAdsSDK:

```swift
import NestAdsOfferwallSDK

// 1. Initialize
NestAdsOfferwall.shared.initialize(
    application: UIApplication.shared,
    appKey: "YOUR_ADCHAIN_APP_KEY",
    appSecret: "YOUR_ADCHAIN_APP_SECRET",
    environment: "production",
    timeoutMillis: 30000
)

// 2. Login user
NestAdsOfferwall.shared.login(
    userId: "user123",
    gender: 1,
    birthYear: 1990
)

// 3. Display Offerwall
NestAdsOfferwall.shared.openOfferwall(
    from: self,
    placementCode: "PLACEMENT_CODE",
    delegate: self  // Conforms to NestAdsOfferwallDelegate
)
```

### Implement Delegate (Optional)

```swift
extension ViewController: NestAdsOfferwallDelegate {
    func offerwallDidOpen() {
        print("Offerwall opened")
    }

    func offerwallDidClose() {
        print("Offerwall closed")
    }

    func offerwallDidFail(error: Error) {
        print("Offerwall error: \(error)")
    }
}
```

## API Reference

### Initialization

```swift
// With NestAdsSDK
NestAds.Offerwall.initialize(
    application: UIApplication,
    appKey: String,
    appSecret: String,
    environment: String = "production",
    timeoutMillis: NSNumber? = nil,
    completion: ((NSError?) -> Void)? = nil
)

// Standalone
NestAdsOfferwall.shared.initialize(
    application: UIApplication,
    appKey: String,
    appSecret: String,
    environment: String,
    timeoutMillis: NSNumber?
)
```

### User Management

```swift
// Login
login(userId: String, gender: Int, birthYear: Int)

// Logout
logout()
```

### Display Offerwall

```swift
openOfferwall(
    from viewController: UIViewController,
    placementCode: String,
    showNavigationBar: Bool = false,
    useNativeNavigationBar: Bool = false,
    delegate: NestAdsOfferwallDelegate? = nil
)
```

### Status Properties

```swift
// Check if initialized
NestAds.Offerwall.isInitialized  // or NestAdsOfferwall.shared.isInitialized

// Check if user is logged in
NestAds.Offerwall.isLoggedIn

// Get current user ID
NestAds.Offerwall.currentUserId

// Get SDK version
NestAds.Offerwall.sdkVersion

// Get AdChain SDK version
NestAds.Offerwall.adchainSDKVersion
```

## Architecture

NestAdsOfferwallSDK is built on a modular, layered architecture:

### Core Layers
- **Public API**: User-facing interfaces (`NestAdsOfferwall`)
- **Manager Layer**: Business logic (`NestAdsOfferwallManager`)
- **Adapter Layer**: AdChain SDK integration
- **Protocol Layer**: Interface definitions and error models

### Key Features
- ✅ **Dynamic Loading**: Seamless integration with NestAdsSDK
- ✅ **Binary Distribution**: Fast installation via xcframework
- ✅ **Crash Debugging**: dSYM symbols included for production debugging
- ✅ **Error Reporting**: Integrated with NestAdsSDK's GlobalExceptionHandler
- ✅ **Type Safety**: Swift-first API with Objective-C compatibility

## Technical Details

- **Minimum iOS Version**: 14.0
- **Swift Version**: 5.9+
- **Distribution Format**: xcframework (binary)
- **Dependencies**: AdChain SDK 1.0.45+
- **Build Settings**: `BUILD_LIBRARY_FOR_DISTRIBUTION` enabled

## Troubleshooting

### SDK Not Found
If you see "NestAdsOfferwallSDK not available" warnings:
1. Ensure the package is added to your project
2. Add `import NestAdsOfferwallSDK` in your AppDelegate
3. Clean build folder (Cmd+Shift+K) and rebuild

### AdChain SDK Error
Make sure AdChain SDK is properly configured:
- Valid App Key and App Secret
- Network connectivity
- Correct environment setting

## Contributing

This is a private SDK. For issues or feature requests, please contact the development team.

## License

Copyright © 2025 NestAds. All rights reserved.
