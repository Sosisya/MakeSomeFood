import UIKit

class CellView: UIView {

    private struct Spec {
        static var maxHeighOfImage: CGFloat = 230
        static var minHeighOfImage: CGFloat = 160
        static var shadowCornerRadius: CGFloat = 12
        static var viewShadowColor = UIColor(named: "black")!.cgColor
        static var shadowOpacity: Float = 0.06
        static var shadowRadius: CGFloat = 10
        static var shadowOffsetHeoght: CGFloat = 12
        static var shadowOffsetWidth: CGFloat = 0
        static var viewCornerRadius: CGFloat = 12
        static var labelColor = UIColor(named: "white")!.cgColor
        static var viewBorderWidth: CGFloat = 1
        static var likeButtomIconName = "heart"
        static var likeSelectedButtomIconName = "heart.fill"
    }
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var nameOfMeal: UILabel!
    @IBOutlet weak var categoryTagLabel: UILabel!
    @IBOutlet weak var areaTagLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var coverImageHeight: NSLayoutConstraint!

    var hasLargeImage: Bool = false {
        didSet {
            let height: CGFloat = hasLargeImage ? Spec.maxHeighOfImage : Spec.minHeighOfImage
            coverImageHeight.constant = height
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setContainerView(containerView)
        setShadowView(shadowView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setTags(categoryTagLabel)
        setTags(areaTagLabel)
        setShadowView(shadowView)
    }

    private func setShadowView(_ view: UIView) {
        view.layer.masksToBounds = false
        view.layer.cornerRadius = Spec.shadowCornerRadius
        view.layer.shadowColor = Spec.viewShadowColor
        view.layer.shadowOpacity = Spec.shadowOpacity
        view.layer.shadowRadius = Spec.shadowRadius
        view.layer.shadowOffset = CGSize(width: Spec.shadowOffsetWidth, height: Spec.shadowOffsetHeoght)
    }

    private func setContainerView(_ view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Spec.viewCornerRadius
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.backgroundColor = Spec.labelColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = Spec.viewBorderWidth
        label.layer.cornerRadius = label.bounds.height / 2
    }

    func setIsFavourite(_ value: Bool) {
        let imageName = value ? Spec.likeSelectedButtomIconName : Spec.likeButtomIconName
        let image = UIImage(systemName: imageName)
        favouriteButton.setImage(image, for: .normal)
    }

    override func awakeAfter(using coder: NSCoder) -> Any? {
        if self.tag == UIView.f_replaceFromXib {
            return CellView.f_replaceFromXib(placeholderView: self)
        }
        return self
    }
}
