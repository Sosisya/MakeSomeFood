import UIKit

class StrechyHeader: UIView {

    private struct Spec {
        static var headerBottomViewCornerRadius: CGFloat = 10
        static var headerFavouriteButtonCornerRadius: CGFloat = 22
    }

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerBottomView: UIView!
    @IBOutlet weak var headerFavouriteButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setContentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setContentView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setShapes()
    }

    private func setShapes() {
        headerBottomView.clipsToBounds = true
        headerBottomView.layer.cornerRadius = Spec.headerBottomViewCornerRadius
        headerBottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        headerFavouriteButton.layer.cornerRadius = Spec.headerFavouriteButtonCornerRadius
    }

    private func setContentView() {
        Bundle.main.loadNibNamed(String(describing: StrechyHeader.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
