import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhotoImage: UIImageView!

    @IBOutlet weak var nameTextField: FloatingTitleTextField!
    @IBOutlet weak var emailTextField: ProfileTextField!
    @IBOutlet weak var passwordTextField: ProfileTextField!

    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"

//        self.nameTextField.delegate = self
//        self.emailTextField.delegate = self
//        self.passwordTextField.delegate = self

        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-SemiBold", size: 24)!]

        profileImage.layer.cornerRadius = 12
        takePhotoImage.layer.cornerRadius = 22

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
