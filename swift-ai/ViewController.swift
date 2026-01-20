
import UIKit
import Foundation
import AVFoundation

import CoreSpotlight
import MobileCoreServices


func requestCameraPermission() {
    let status = AVCaptureDevice.authorizationStatus(for: .video)

    switch status {
    case .authorized:
        print("✅ Camera access is already granted")
    case .notDetermined:
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                if granted {
                    print("✅ Camera access granted")
                } else {
                    print("❌ Camera access denied")
//                    self.showPermissionAlert() // Show an alert if needed
                }
            }
        }
    case .denied, .restricted:
        print("❌ Camera access denied or restricted")
//        showPermissionAlert()
    @unknown default:
        print("⚠️ Unknown camera permission status")
    }
}


class ViewController: UIViewController, UITextFieldDelegate {
    
//    @IBOutlet weak var usernameTextField: UITextField!
//    @IBOutlet weak var passwordTextField: UITextField!
//    @IBOutlet weak var continueButton: UIButton!
//    @IBOutlet weak var label: UILabel!
    
    private let sessionId = UUID().uuidString  // one per conversation

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        requestCameraPermission()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem

        
//        let welcomeText = NSLocalizedString("welcome_message", comment: "Welcome message")
//        label.text = welcomeText
        
        let welcomeFormat = String(localized: "welcome_message_format", comment: "Welcome message with user name")
        let welcomeText = String(format: welcomeFormat, "John")
//        label.text = "Farmers Mobile app" // welcomeText
        
        indexPayments()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func startChat(_ sender: UIButton) {
//        let vc = ChatViewController(sessionId: sessionId)
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func continueTapped(_ sender: UIButton) {
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC {
//            navigationController?.pushViewController(homeVC, animated: true)
//        }
//        
////        if let webViewVC = storyboard.instantiateViewController(withIdentifier: "WebViewVC") as? WebViewVC {
////            navigationController?.pushViewController(webViewVC, animated: true)
////        }
    }
    
    func indexPayments() {
        let attributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeItem as String)
        attributeSet.title = "Pay Bill"
        attributeSet.contentDescription = "Pay your bill, make a payment, view recent transactions, or set up auto pay."
        attributeSet.keywords = ["pay", "payment", "make payment", "make a payment", "bill"]

        let item = CSSearchableItem(
            uniqueIdentifier: "com.farmers.swift.FarmersPOCs",
            domainIdentifier: "payments",
            attributeSet: attributeSet
        )

        CSSearchableIndex.default().indexSearchableItems([item]) { error in
            if let error = error {
                print("Indexing error: \(error.localizedDescription)")
            } else {
                print("Workout successfully indexed!")
            }
        }
    }
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }

}


