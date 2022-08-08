import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        setCell(categoryImage)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setCell(_ image: UIImageView) {
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 12
    }
    
}
