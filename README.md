# MyBinaryFrameworkUsage

This repository aims to replicate [Firebase's approach](https://forums.swift.org/t/swiftpm-binary-target-with-sub-dependencies/40197/5) to distributing a XCFramework binary that depends on open source packages.

[Swift Package Manager maintainers say such thing isn't supported](https://forums.swift.org/t/issue-with-third-party-dependencies-inside-a-xcframework-through-spm/41977/3), since many conflicts can come up from a binary relying on packages.

Since I can't really look into Firebase's Analytics XCFramework binary to see what and how they import things, I'm working with the assumption, based on Paul's comment, that such thing can be worked around.

You can see that a simple package called [MyBinaryFramework](https://github.com/CassiusPacheco/MyBinaryFramework) makes use of another package, and is then exported as a XCFramework using [swift-create-xcframework](https://github.com/unsignedapps/swift-create-xcframework).

The XCFramework is then used by this package, `MyBinaryFrameworkUsage`, through a series of target wrappers, [as FirebaseAnalytics does](https://github.com/firebase/firebase-ios-sdk/blob/master/Package.swift#L299).

`MyBinaryFrameworkUsage` is then used by the Sample project (present in this same repository). All seems to compile and work until the app is launched, then a runtime error is thrown due to the MyBinaryFramework's dependency, Valet, not being loaded

> dyld[97851]: Library not loaded: @rpath/Valet.framework/Valet

This is where I get stuck. Not sure if it's purely due to the limitations decribed by the Apple engineer above, but if so, how does Firebase does it?

Any help is welcome!

Thanks
