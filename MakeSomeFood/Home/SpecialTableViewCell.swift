import UIKit

class SpecialTableViewCell: UITableViewCell {
    @IBOutlet weak var cellView: CellView!

    override func prepareForReuse() {
        super.prepareForReuse()
        cellView.coverImageView.kf.cancelDownloadTask()
        cellView.coverImageView.image = nil
    }
}
