import UIKit

class CellView: UIView {
    @IBOutlet weak var todayCookingView: UIView!
    @IBOutlet weak var todayCookingImage: UIImageView!
    @IBOutlet weak var nameOfMeal: UILabel!
    @IBOutlet weak var categoryTagLabel: UILabel!
    @IBOutlet weak var areaTagLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var favouriteButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        setContainerView(todayCookingView)
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
        view.layer.cornerRadius = 12

        view.layer.shadowColor = UIColor(named: "black")!.cgColor
        view.layer.shadowOpacity = 0.06
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 0, height: 12)
    }

    private func setContainerView(_ view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = label.bounds.height / 2
    }

    func setIsFavourite(_ value: Bool) {
        let imageName = value ? "heart.fill" : "heart"
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

