import UIKit

class CollectionSectionHeaderView: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    @IBOutlet private weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var trailingConstraint: NSLayoutConstraint!
    private var openAllTags: (() -> Void)?

    func configure(title: String, actionTitle: String = "", offset: CGFloat = 0, openAllTags: (() -> Void)? = nil) {
        titleLabel.text = title
        actionButton.setTitle(actionTitle, for: .normal)
        leadingConstraint.constant = offset
        trailingConstraint.constant = offset
        self.openAllTags = openAllTags
    }

    @IBAction func pressAllTagsButton() {
        openAllTags?()
    }
}
