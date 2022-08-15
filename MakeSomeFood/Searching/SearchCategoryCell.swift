import UIKit

class SearchCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categiryTagButton: UIButton!

    override func layoutSubviews() {
        setTagButtons(categiryTagButton)
    }

    func setTagButtons(_ button: UIButton) {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
    }
}
