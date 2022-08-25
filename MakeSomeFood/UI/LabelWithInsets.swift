import UIKit

class LabelWithInsets: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 8)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize
        size.width += 16
        size.height += 8
        return size
    }
}
