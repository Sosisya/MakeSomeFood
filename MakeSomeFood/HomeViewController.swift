import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var todayCookingView: UIView!
    @IBOutlet weak var profilePhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTodayCooking()
        setProfilePhoto()
    }

    private func setTodayCooking() {
        todayCookingView.layer.masksToBounds = true
        todayCookingView.layer.cornerRadius = 12
    }

    private func setProfilePhoto() {
        profilePhoto.layer.masksToBounds = true
        profilePhoto.layer.cornerRadius = 20 //цифру 20 писала наугад. Как правильно сделать картинку круглой?
    }
}
