import UIKit

class ProfileImageAndNameTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setImage(profileImage)
    }

    func setImage(_ image: UIImageView) {
        image.layer.cornerRadius = 12
    }
}
