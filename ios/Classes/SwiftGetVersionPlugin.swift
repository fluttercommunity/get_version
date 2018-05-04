import Flutter
import UIKit
    
public class SwiftGetVersionPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "get_version", binaryMessenger: registrar.messenger())
    let instance = SwiftGetVersionPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
   
    switch (call.method) {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion);
        case "getProjectVersion":
            result(Bundle.main.releaseVersionNumber);
        case "getProjectCode":
            result(Bundle.main.buildVersionNumber);
        case "getAppID":
            if let bundleIdentifier = Bundle.main.bundleIdentifier {
                result(bundleIdentifier) //Your App ID on App Store
            } else {
                result("No App ID Found")
            }
            
        default:
            result(FlutterMethodNotImplemented)
    }
  }

}

extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String 
    }
}
