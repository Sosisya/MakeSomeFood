import UIKit

class SearchingViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTags(tagLabel)
        layer.masksToBounds = true
    }

    private func setTags(_ label: UILabel) {
        label.textColor = .white
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
    }
}
