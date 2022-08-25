import UIKit

class SearchingViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTags(tagLabel)
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 13
        label.textColor = .white
    }
}
