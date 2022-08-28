import UIKit

class CollectionSectionHeaderView: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!

    func configure(title: String) {
        titleLabel.text = title
    }
}
