import UIKit

class Header: UIView {

    @IBOutlet var headerTitle: UILabel!

    override func awakeAfter(using coder: NSCoder) -> Any? {
        if tag == UIView.f_replaceFromXib {
            return Header.f_replaceFromXib(placeholderView: self)
        }
        return self
    }
}
