import UIKit

extension UIView {
    static func f_loadInstanceFromNibIfPossible() -> Self? {
        return Bundle.main.loadNibNamed(String(describing: classForCoder()), owner: self, options: nil)?[0] as? Self
    }

    static func f_loadInstanceFromNib() -> Self {
        return f_loadInstanceFromNibIfPossible()!
    }

    static let f_replaceFromXib = 666

    static func f_replaceFromXib(placeholderView: UIView) -> UIView {
        return f_replaceFromXib(placeholderView: placeholderView, nibName: String(describing: classForCoder()))
    }

    static func f_replaceFromXib(placeholderView: UIView, nibName: String) -> UIView {
        let view = f_loadInstanceFromNib()
        view.frame = placeholderView.frame
        view.clipsToBounds = placeholderView.clipsToBounds
        view.alpha = placeholderView.alpha
        view.backgroundColor = placeholderView.backgroundColor
        view.autoresizingMask = placeholderView.autoresizingMask
        view.translatesAutoresizingMaskIntoConstraints = placeholderView.translatesAutoresizingMaskIntoConstraints

        var constraints: [NSLayoutConstraint] = []
        let placeholderConstraints = placeholderView.constraints
        placeholderConstraints.forEach { (placeholderConstraint) in
            if (placeholderConstraint.firstItem as? UIView) == placeholderView, placeholderConstraint.secondItem == nil, placeholderConstraint.firstAttribute == .height {
                let heightConstraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: placeholderConstraint.constant)
                heightConstraint.constant = placeholderConstraint.constant
                constraints.append(heightConstraint)
            }

            if (placeholderConstraint.firstItem as? UIView) == placeholderView, placeholderConstraint.secondItem == nil, placeholderConstraint.firstAttribute == .width {
                let widthConstraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: placeholderConstraint.constant)
                widthConstraint.constant = placeholderConstraint.constant
                constraints.append(widthConstraint)
            }
        }
        NSLayoutConstraint.activate(constraints)
        return view
    }
}
