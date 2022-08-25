import UIKit

class FavouritesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TodayCookingTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayCookingTableViewCell")
        tableView.separatorStyle = .none
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return favouriteRecepies.count
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UINib(nibName: "TableSectionHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TableSectionHeaderView
        
        switch section {
        case 0:
            header.configure(title: "Избранное")
        default:
            return nil
        }
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
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
}
