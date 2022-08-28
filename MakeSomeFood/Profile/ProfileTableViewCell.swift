import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
