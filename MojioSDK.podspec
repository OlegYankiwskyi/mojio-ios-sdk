Pod::Spec.new do |spec|
    spec.name = "MojioSDK"
    spec.version = "2.0.0"
    spec.summary = "Framework for adding Mojio support to your iOS app"
    spec.homepage = "https://github.com/mojio/mojio-ios-sdk"
    spec.license = {type: 'MIT', file: 'LICENSE'}
    spec.authors = {"Mojio, Inc." => 'support@moj.io'}
    spec.social_media_url = "https://twitter.com/getmojio"

    spec.platform = :ios, "9.0"
    spec.requires_arc = true
    spec.source = { git: "https://github.com/mojio/mojio-ios-sdk.git", tag: "v#{spec.version}", submodules: true }
    spec.source_files = "MojioSDK/**/*.{h,swift}"

    spec.dependency 'Alamofire', '3.5.0'
    spec.dependency 'SwiftyJSON', '2.3.2'
    spec.dependency 'ObjectMapper', '~> 1.1'
    spec.dependency 'KeychainSwift'
    spec.dependency 'OHHTTPStubs'
    spec.dependency 'OHHTTPStubs/Swift'
    spec.dependency 'SwiftWebSocket', '2.6.4'
end
