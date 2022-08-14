import UIKit

class CategoryTableViewController: UITableViewController {

    var category: Category!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        title = category.nameOfCategory
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedCategoryCell", for: indexPath) as! SelectedCategoryCell
            cell.descriptionOfSelectedRecepie.text = selectedCategoryRecepies[indexPath.row].nameOfRecepie
            cell.selectedCategoryImage.image = selectedCategoryRecepies[indexPath.row].image
            return cell
        default:
            fatalError()
        }
    }
}
