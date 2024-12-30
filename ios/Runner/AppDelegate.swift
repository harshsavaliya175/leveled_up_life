import UIKit
import Flutter
import BranchSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
                  if let error = error {
                      print("Branch initialization error: \(error.localizedDescription)")
                  } else if let params = params {
                      print("Branch params: \(params)")
                      // Handle deep link params here
                  }
            }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
