import UIKit

class TodayCookingCell: UITableViewCell {

    @IBOutlet weak var todayCookinView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCellView(todayCookinView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCellView(_ cellView: UIView) {
        cellView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 12
    }

}
