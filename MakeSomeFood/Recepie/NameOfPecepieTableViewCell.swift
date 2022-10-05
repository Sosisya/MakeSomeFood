import UIKit

class NameOfRecepieTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfRecepieLabel: UILabel!
    @IBOutlet weak var categoryTagLabel: LabelWithInsets!
    @IBOutlet weak var areaTagLabel: LabelWithInsets!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTags(categoryTagLabel)
        setTags(areaTagLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = label.bounds.height / 2
    }
}
