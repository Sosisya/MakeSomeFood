import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhotoImage: UIImageView!

    @IBOutlet weak var nameTextField: ProfileTextField!
    @IBOutlet weak var emailTextField: ProfileTextField!
    @IBOutlet weak var passwordTextField: ProfileTextField!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!


    @IBOutlet weak var nameCancelButton: UIButton!
    @IBOutlet weak var emailCancelButton: UIButton!
    @IBOutlet weak var passwordHideButton: UIButton!

    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"

        floatTitle(nameLabel)
        floatTitle(emailLabel)
        //        action(someButton)
        //        oneMoreAction(closeButton)

        self.nameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self


        nameCancelButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        emailCancelButton.addTarget(self, action: #selector(action), for: .touchUpInside)
        passwordHideButton.addTarget(self, action: #selector(oneMoreAction), for: .touchUpInside)

        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-SemiBold", size: 24)!]

        profileImage.layer.cornerRadius = 12
        takePhotoImage.layer.cornerRadius = 22
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Имя", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "gray")!])
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Почта", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "gray")!])
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Пароль", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "gray")!])

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

    func textFieldDidBeginEditing(_ textField: UITextField) {
        floatTitle(nameLabel)
        floatTitle(emailLabel)
        floatTitle(passwordLabel)
        performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
    }

// This is where we adjust constraint and the label will float to the top
    func floatTitle(_ label: UILabel) {
    someLabel.font = someLabel.font?.withSize(12)
    top.constant = 10
    leading.constant = 10
}

// By adding a little animation
private func performAnimation(transform: CGAffineTransform) {
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
        self.someLabel.transform = transform
        self.view.layoutIfNeeded()
    }, completion: nil)
}

func textFieldDidEndEditing(_ textField: UITextField) {
    if textField.text?.isEmpty ?? false {
        configureEndEditing()
    }
}

func unfloatTitle() {
    someTextField.placeholder = nil
    top.constant = 20
    leading.constant = 10
    someLabel.font = someLabel.font?.withSize(16)
}

private func configureEndEditing() {
    unfloatTitle()
    performAnimation(transform: CGAffineTransform(scaleX: 1, y: 1))
}

@objc func action(_ sender: UIButton) {
    let isSecureTextEntry = someTextField.isSecureTextEntry
    someTextField.isSecureTextEntry = isSecureTextEntry ? false : true
    if isSecureTextEntry {
        someButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
    } else {
        someButton.setImage(UIImage(systemName: "eye"), for: .normal)
    }
}


@objc func oneMoreAction(_ sender: UIButton) {
    someOneTextField.text = ""
}
}
