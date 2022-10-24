import UIKit

class BorderedTextField: UITextField {

    private struct Spec {
        static var paddingInsetTop: CGFloat = 0
        static var paddingInsetLeft: CGFloat = 12
        static var paddingInsetBottom: CGFloat = 0
        static var paddingInsetRight: CGFloat = 12
        static var borderWidth: CGFloat = 1
        static var borderCornerRadius: CGFloat = 12
        static var borderColor = UIColor(named: "gray")?.cgColor
    }

    let padding = UIEdgeInsets(top: Spec.paddingInsetTop, left: Spec.paddingInsetLeft, bottom: Spec.paddingInsetBottom, right: Spec.paddingInsetRight)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        commonInit()
    }

    private func commonInit() {
        layer.borderWidth = Spec.borderWidth
        layer.borderColor = Spec.borderColor
        layer.cornerRadius = Spec.borderCornerRadius
        layer.masksToBounds = true
    }
}
