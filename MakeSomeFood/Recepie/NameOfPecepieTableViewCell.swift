import UIKit

class NameOfPecepieTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfMeal: UILabel!
    @IBOutlet weak var tagOfCategory: LabelWithInsets!
    @IBOutlet weak var tagOfArea: LabelWithInsets!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
