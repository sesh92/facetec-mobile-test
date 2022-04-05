# Setup

!IMPORTANT You unavailable to complete the build this project if you don't have apple developer account.

also you have to create facetec account and setup SDK to the project:

- move the framework to Frameworks dir
- move the Config.swift file from sdk simple app and another interested you settings.

## Install dependencies

```:bash
yarn install
```

```:bash
cd ios
pod install
cd ..
```

I recommend using ngrok to connect your real devices to your localhost server.

open ios/mobile.xcworkspace via Xcode.

connect and select your real ios device and run the project.

## TODO

- [x] Ios bridge is finished
- [ ] Android bridge is not finished
