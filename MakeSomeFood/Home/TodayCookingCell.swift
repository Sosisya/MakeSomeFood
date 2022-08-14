import UIKit

class TodayCookingCell: UITableViewCell {
    @IBOutlet weak var todayCookingView: UIView!
    @IBOutlet weak var todayCookingImage: UIImageView!
    @IBOutlet weak var nameOfMeal: UILabel!
    @IBOutlet weak var categoryTagLabel: UILabel!
    @IBOutlet weak var areaTagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCellView(todayCookingView)
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

    private func setCellView(_ view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12

        view.layer.shadowColor = UIColor(named: "black")!.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = label.bounds.height / 2
    }
}
