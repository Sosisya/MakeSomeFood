import UIKit

class ProfilePhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var takePhoto: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 12

        takePhoto.layer.masksToBounds = true
        takePhoto.layer.cornerRadius = 22
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
