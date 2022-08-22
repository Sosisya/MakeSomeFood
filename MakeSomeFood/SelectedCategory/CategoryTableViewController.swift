import UIKit

class CategoryTableViewController: UITableViewController {
    
    var category: Category!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = category.nameOfCategory
        tableView.register(UINib(nibName: "SelectedCategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "SelectedCategoryTableViewCell")
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCategoryTableViewCell", for: indexPath) as! SelectedCategoryTableViewCell
            let item = selectedCategoryRecepies[indexPath.row]
            cell.selectedCategoryView.nameOfMeal.text = item.nameOfMeal
            cell.selectedCategoryView.todayCookingImage.image = item.image
            cell.selectedCategoryView.areaTagLabel.text = item.areaTagLabel
            cell.selectedCategoryView.categoryTagLabel.text = item.categoryTagLabel
            cell.selectedCategoryView.setIsFavourite(false)
            return cell
        default:
            fatalError()
        }
    }
}
