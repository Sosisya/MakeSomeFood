import UIKit

class TableSectionHeaderView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var actionButton: UIButton!
    private var buttonAction: () -> Void = {}

    func configure(title: String, actionTitle: String? = nil, action: @escaping () -> Void = {}) {
        titleLabel.text = title
        if let actionTitle = actionTitle {
            actionButton.isHidden = false
            actionButton.setTitle(actionTitle, for: .normal)
        } else {
            actionButton.isHidden = true
        }
        buttonAction = action
    }

    @IBAction private func onActionButtonTapped() {
        buttonAction()
    }


}
