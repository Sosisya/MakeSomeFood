import UIKit

class SelectedCategoryCell: UITableViewCell {

    @IBOutlet weak var selectedCategoryView: UIView!
    @IBOutlet weak var selectedCategoryImage: UIImageView!
    @IBOutlet weak var descriptionOfSelectedRecepie: UILabel!
    @IBOutlet weak var areaTag: UILabel!
    @IBOutlet weak var categoryTag: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setTags(categoryTag)
        setTags(areaTag)
        setView(selectedCategoryView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setTags(_ label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.backgroundColor = UIColor.white.cgColor
        label.layer.borderColor = label.textColor.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius = label.bounds.height / 2
    }

    private func setView(_ view: UIView) {
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemGray2.cgColor
    }


}
