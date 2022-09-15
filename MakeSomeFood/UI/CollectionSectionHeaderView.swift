import UIKit

class CollectionSectionHeaderView: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var trailingConstraint: NSLayoutConstraint!

    func configure(title: String, offset: CGFloat = 0) {
        titleLabel.text = title
        leadingConstraint.constant = offset
        trailingConstraint.constant = offset
    }
}
