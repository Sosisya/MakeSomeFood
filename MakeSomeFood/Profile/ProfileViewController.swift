import UIKit

class ProfileViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    struct ProfileData: Equatable {
        var changedPhoto: Bool
        var name: String
        var email: String
        var password: String
    }

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!

    @IBOutlet weak var nameTextField: FloatingTitleTextField!
    @IBOutlet weak var emailTextField: FloatingTitleTextField!
    @IBOutlet weak var passwordTextField: FloatingTitleTextField!

    @IBOutlet weak var scrollViewBottom: NSLayoutConstraint!

    @IBOutlet weak var saveButton: UIButton!

    private var initialValues = ProfileData(changedPhoto: false, name: "", email: "", password: "")
    private var currentValues: ProfileData {
        ProfileData(changedPhoto: false, name: nameTextField.text, email: emailTextField.text, password: passwordTextField.text)
    }
    private var hasChanges: Bool {
        initialValues != currentValues
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"
        
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-SemiBold", size: 24)!]

        profileImage.layer.cornerRadius = 12
        takePhotoButton.layer.cornerRadius = 22

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

        alert.addAction(UIAlertAction(title: "Сделать фото", style: .default , handler:{ (UIAlertAction)in
            print("User click Approve button")
        }))

        alert.addAction(UIAlertAction(title: "Выбрать из галлереи", style: .default , handler:{ (UIAlertAction)in
            print("User click Edit button")
        }))

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))

        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }

    @IBAction func showExitAllert(_ sender: UIButton) {
        let alert = UIAlertController(title: "Вы уверены что хотите выйти из профиля?", message: nil, preferredStyle: .actionSheet)

            alert.addAction(UIAlertAction(title: "Выйти из профиля", style: .default , handler:{ (UIAlertAction)in
                print("User click Approve button")
            }))

//            alert.addAction(UIAlertAction(title: "Edit", style: .default , handler:{ (UIAlertAction)in
//                print("User click Edit button")
//            }))
//
//            alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction)in
//                print("User click Delete button")
//            }))

            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler:{ (UIAlertAction)in
                print("User click Dismiss button")
            }))


            //uncomment for iPad Support
            //alert.popoverPresentationController?.sourceView = self.view

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
}
