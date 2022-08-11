import UIKit

class SelectedCategoryCell: UITableViewCell {

    @IBOutlet weak var selectedCategoryView: UIView!
    @IBOutlet weak var selectedCategoryImage: UIImageView!
    @IBOutlet weak var descriptionOfSelectedRecepie: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
