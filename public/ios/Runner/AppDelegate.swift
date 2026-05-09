import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // Override the default tel: behavior
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        // Register a custom URL scheme handler
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "tel" || url.scheme == "telprompt" {
            // Handle phone calls programmatically without confirmation
            if let phoneNumber = url.host {
                let cleanedNumber = phoneNumber.replacingOccurrences(of: "+", with: "")
                if let telURL = URL(string: "telprompt://\(cleanedNumber)") {
                    UIApplication.shared.open(telURL, options: [:], completionHandler: nil)
                }
            }
            return true
        }
        return super.application(app, open: url, options: options)
    }
}