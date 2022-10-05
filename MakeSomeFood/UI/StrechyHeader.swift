import UIKit

class StrechyHeader: UIView {

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
        headerBottomView.layer.cornerRadius = 10
        headerBottomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        headerFavouriteButton.layer.cornerRadius = 22
    }

    private func setContentView() {
        Bundle.main.loadNibNamed(String(describing: StrechyHeader.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
