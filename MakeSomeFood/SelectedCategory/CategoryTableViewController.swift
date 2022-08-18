import UIKit

class CategoryTableViewController: UITableViewController {

    var category: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = category.nameOfCategory
        tableView.register(UINib(nibName: "TodayCookingTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayCookingTableViewCell")
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
            cell.todayCookingView.nameOfMeal.text = item.nameOfRecepie
            cell.todayCookingView.todayCookingImage.image = item.image
            cell.todayCookingView.setIsFavourite(true)
//            cell.descriptionOfSelectedRecepie.text = selectedCategoryRecepies[indexPath.row].nameOfRecepie
//            cell.selectedCategoryImage.image = selectedCategoryRecepies[indexPath.row].image
            return cell
        default:
            fatalError()
        }
    }
}
