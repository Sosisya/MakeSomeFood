import UIKit

class FavouritesTableViewController: UITableViewController, RecepiePresenting {

    private struct Spec {
        static let titleOfHeader = "Избранное"
    }

    enum Section: Int, CaseIterable {
        case favouriteRecepies
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TodayCookingTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayCookingTableViewCell")
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .favouriteRecepies:
            return favouriteRecepies.count
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
        switch Section(rawValue: section) {
        case .favouriteRecepies:
            header.configure(title: Spec.titleOfHeader)
        default:
            return nil
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .favouriteRecepies:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCookingTableViewCell", for: indexPath) as! TodayCookingTableViewCell
            let item = favouriteRecepies[indexPath.row]
            cell.cellView.nameOfMeal.text = item.nameOfMeal
            cell.cellView.coverImageView.image = item.image
            cell.cellView.categoryTagLabel.text = item.categoryTagLabel
            cell.cellView.areaTagLabel.text = item.areaTagLabel
            cell.cellView.setIsFavourite(true)
            cell.cellView.hasLargeImage = false
            return cell
        default:
            fatalError()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showRecepie(recepie)
    }
}
