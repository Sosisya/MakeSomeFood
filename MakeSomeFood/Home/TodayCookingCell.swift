import UIKit

class TodayCookingCell: UITableViewCell {
    @IBOutlet weak var todayCookinView: UIView!
    @IBOutlet weak var categoryTagLabel: UILabel!
    @IBOutlet weak var areaTagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCellView(todayCookinView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setTags(categoryTagLabel)
        setTags(areaTagLabel)
//        todayCookinView.layer.shadowPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCellView(_ cellView: UIView) {
        cellView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 12

        cellView.layer.shadowColor = UIColor(named: "black")!.cgColor
        cellView.layer.shadowOpacity = 1
        cellView.layer.shadowRadius = 12
        cellView.layer.shadowOffset = CGSize(width: 0, height: 1)
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = label.bounds.height / 2
    }
}
