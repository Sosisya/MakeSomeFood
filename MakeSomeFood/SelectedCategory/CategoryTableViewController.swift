import UIKit

class CategoryTableViewController: UITableViewController {
    var category: Category!

    private struct Spec {
        static var fontOfHeaderFont = UIFont(name: "Montserrat-SemiBold", size: 24)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = category.nameOfCategory
        self.navigationController?.navigationBar.titleTextAttributes = [.font: Spec.fontOfHeaderFont]
        tableView.register(UINib(nibName: "TodayCookingTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayCookingTableViewCell")
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return selectedCategoryRecepies.count
        default:
            fatalError()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCookingTableViewCell", for: indexPath) as! TodayCookingTableViewCell
            let item = selectedCategoryRecepies[indexPath.row]
            cell.cellView.nameOfMeal.text = item.nameOfMeal
            cell.cellView.coverImageView.image = item.image
            cell.cellView.areaTagLabel.text = item.areaTagLabel
            cell.cellView.categoryTagLabel.text = item.categoryTagLabel
            cell.cellView.setIsFavourite(false)
            cell.cellView.hasLargeImage = false
            return cell
        default:
            fatalError()
        }
    }
}
