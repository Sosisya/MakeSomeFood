import UIKit

class TodayCookingCell: UITableViewCell {

    @IBOutlet weak var todayCookinView: UIView!
    @IBOutlet weak var categoryTagLabel: UILabel!
    @IBOutlet weak var areaTagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCellView(todayCookinView)
        setTags(categoryTagLabel)
        setTags(areaTagLabel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCellView(_ cellView: UIView) {
        cellView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 12
        cellView.layer.borderColor = UIColor.systemGray2.cgColor
        cellView.layer.borderWidth = 1
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.orange.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 22
    }

}
