import UIKit

class NameOfRecepieTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfRecepieLabel: UILabel!
    @IBOutlet weak var categoryTagLabel: LabelWithInsets!
    @IBOutlet weak var areaTagLabel: LabelWithInsets!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
