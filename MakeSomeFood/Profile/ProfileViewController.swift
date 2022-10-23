import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    private struct Spec {
        static var navigationTitle = "Profile"
        static var navigationTitleFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
        static var profileImageCornerRadius: CGFloat = 12
        static var takePhotoButtonCornerRadius: CGFloat = 22

        static var takePhotoButtonFirstAlertTitle = "Take a photo"
        static var takePhotoButtonSecondAlertTitle = "Choose from gallery"
        static var takePhotoButtonCancelAlertTitle = "Cancel"

        static var exitButtonMainAlertTitle = "Are you sure you want to log out of your profile?"
        static var exitButtonFirstAlertTitle = "Log out"
        static var exitButtonCancelAlertTitle = "Cancel"
    }

    struct ProfileData: Equatable {
        var changedPhoto: Bool
        var name: String
        var email: String
        var password: String
    }

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var nameTextField: FloatingTitleTextField!
    @IBOutlet weak var emailTextField: FloatingTitleTextField!
    @IBOutlet weak var passwordTextField: FloatingTitleTextField!
    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!

    private var initialValues = ProfileData(changedPhoto: false, name: "", email: "", password: "")
    private var currentValues: ProfileData {
        ProfileData(changedPhoto: false, name: nameTextField.text, email: emailTextField.text, password: passwordTextField.text)
    }
    private var hasChanges: Bool {
        initialValues != currentValues
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = Spec.navigationTitle
        
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.navigationTitleFont]

        profileImage.layer.cornerRadius = Spec.profileImageCornerRadius
        takePhotoButton.layer.cornerRadius = Spec.takePhotoButtonCornerRadius

        nameTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        emailTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        reloadSaveButton()
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

    @objc private func textFieldDidChange(_ textField: UITextField) {
        DispatchQueue.main.async {
            self.reloadSaveButton()
        }
    }

    private func reloadSaveButton() {
        saveButton.isHidden = !hasChanges
    }

    @IBAction func showPhotoAllert(_ sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: Spec.takePhotoButtonFirstAlertTitle, style: .default , handler:{ (UIAlertAction) in
            print("User click Approve button")
        }))

        alert.addAction(UIAlertAction(title: Spec.takePhotoButtonSecondAlertTitle, style: .default , handler:{ (UIAlertAction) in
            print("User click Edit button")
        }))

        alert.addAction(UIAlertAction(title: Spec.takePhotoButtonCancelAlertTitle, style: .cancel, handler:{ (UIAlertAction) in
            print("User click Dismiss button")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }

    @IBAction func showExitAllert(_ sender: UIButton) {
        let alert = UIAlertController(title: Spec.exitButtonMainAlertTitle, message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: Spec.exitButtonFirstAlertTitle, style: .destructive , handler:{ (UIAlertAction)in
                print("User click Approve button")
            }))

        alert.addAction(UIAlertAction(title: Spec.exitButtonCancelAlertTitle, style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
}
