import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginWithAppleAccountButton: UIButton!
    @IBOutlet weak var loginWithGoogleAccountButton: UIButton!
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!
    @IBOutlet weak var linksTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var registerStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var linksLabel: UILabel!

    private struct Spec {
        static var linksLabelMinOffsetHeight: CGFloat = 8
        static var linksLabelRealOffsetHeight: CGFloat = 18
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let filledHeight = registerStackView.frame.maxY
        let fullHeight = scrollView.frame.height
        let minOffset = Spec.linksLabelMinOffsetHeight + linksLabel.frame.height
        let realOffSet = fullHeight - filledHeight - Spec.linksLabelRealOffsetHeight
        linksTopConstraint.constant = max(realOffSet, minOffset)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let tabBarHeight = tabBarController?.tabBar.frame.height ?? 0
            scrollViewBottom.constant = keyboardSize.height - tabBarHeight
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollViewBottom.constant = 0
    }
}
