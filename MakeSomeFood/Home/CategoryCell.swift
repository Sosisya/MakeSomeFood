import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!

    private struct Spec {
        static var categoryViewCornerRadius: CGFloat = 12
        static var categoryImageCornerRadius: CGFloat = 12
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellImage(categoryImage)
        setCellView(categoryView)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setCellImage(_ image: UIImageView) {
        image.layer.masksToBounds = true
        image.layer.cornerRadius = Spec.categoryImageCornerRadius
    }
    
    private func setCellView(_ view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Spec.categoryViewCornerRadius
    }
}
