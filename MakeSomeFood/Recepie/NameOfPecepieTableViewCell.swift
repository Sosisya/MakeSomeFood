import UIKit

class NameOfRecepieTableViewCell: UITableViewCell {

    private struct Spec {
        static var labelBorderWidth: CGFloat = 1
        static var labelBackgroundColor = UIColor(named: "white")?.cgColor
    }

    @IBOutlet weak var nameOfRecipeLabel: UILabel!
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
        label.layer.backgroundColor = Spec.labelBackgroundColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = Spec.labelBorderWidth
        label.layer.cornerRadius = label.bounds.height / 2
    }
}
