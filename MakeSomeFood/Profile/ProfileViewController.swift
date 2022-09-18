import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhotoImage: UIImageView!
    @IBOutlet weak var nameTextField: ProfileTextField!
    @IBOutlet weak var emailTextField: ProfileTextField!
    @IBOutlet weak var passwordTextField: ProfileTextField!
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"

        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-SemiBold", size: 24)!]

        profileImage.layer.cornerRadius = 12
        takePhotoImage.layer.cornerRadius = 22
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "gray")])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Почта", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "gray")])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "gray")])

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollViewBottom.constant = keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        scrollViewBottom.constant = 0
    }
}
