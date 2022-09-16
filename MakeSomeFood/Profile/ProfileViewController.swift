import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhotoImage: UIImageView!
    @IBOutlet weak var nameTextField: BorderedTextField!
    @IBOutlet weak var emailTextField: BorderedTextField!
    @IBOutlet weak var passwordTextField: BorderedTextField!
    @IBOutlet weak var exitFromProfileButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Профиль"

        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont(name: "Montserrat-SemiBold", size: 24)!]

        profileImage.layer.cornerRadius = 12
        takePhotoImage.layer.cornerRadius = 22


    }
}
