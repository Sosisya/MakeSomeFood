import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        setCellImage(categoryImage)
        setCellView(categoryView)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCellImage(_ image: UIImageView) {
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
    }

    private func setCellView(_ cellView: UIView) {
        cellView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 12
    }
}
