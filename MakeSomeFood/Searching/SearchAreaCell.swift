import UIKit

class SearchAreaCell: UICollectionViewCell {

    @IBOutlet weak var areaTagButton: UIButton!

    override func layoutSubviews() {
        setTagButtons(areaTagButton)
    }

    func setTagButtons(_ button: UIButton) {
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
    }
}
